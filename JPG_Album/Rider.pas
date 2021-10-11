 unit Rider;

 interface
 uses Windows,SysUtils,Classes,Controls,Forms,ExtCtrls,StdCtrls,Messages,
  ComCtrls,XPMan,Registry,jpeg,Buttons,Graphics,Dialogs,Gauges;

 type

 TJPGA_Main=class(TForm)
Panel1:TPanel;Panel2:TPanel;Panel3:TPanel;Panel4:TPanel;Op:TOpenDialog;
XPManifest1:TXPManifest;Sv:TSaveDialog;sps:TComboBox;gg:TGauge;Image1:TImage;
sbNext:TSpeedButton;sbPrev:TSpeedButton;sbSave:TSpeedButton;sbOpen:TSpeedButton;

  function  ReadTextInFile(var Text:string):boolean;
  procedure LoadJPGAlbumFile;
  procedure JpegLoad(NumImage:integer;Mode:boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1Progress(Sender:TObject;Stage:TProgressStage;
    PercentDone:Byte;RedrawNow:Boolean;const R:TRect;const Msg: String);
    procedure sbPrevClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure sbOpenClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spsChange(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

 var  JPGA_Main:TJPGA_Main;FileList:TStrings;

    implementation

  uses XorCrypt;

  const TxtHeader:string = #$29#$06#$09#$04#$FF#$D9;

  {$R *.dfm}
 procedure Set_extFile;
 var r:Tregistry;
 begin
 r:=TRegistry.Create; with r do begin RootKey:=HKEY_CLASSES_ROOT;
 OpenKey('.jpga',True);WriteString('','JPGAfile');CloseKey;
 CreateKey('JPGAfile');OpenKey('JPGAfile\DefaultIcon',True);
 WriteString('',Application.ExeName+',0');CloseKey;
 OpenKey('JPGAfile\shell\open\command',True);
 WriteString('',Application.ExeName+' %1');CloseKey;Free;end;
 end;

 procedure TJPGA_Main.FormCreate(Sender: TObject);
 begin
 FileList:= tstringlist.Create;Set_extFile;
 end;

 procedure TJPGA_Main.FormDestroy(Sender: TObject);
 begin
 FileList.Free;
 end;

 procedure TJPGA_Main.Image1Progress(Sender: TObject;
 Stage:TProgressStage;PercentDone:Byte;RedrawNow:Boolean;
                     const R: TRect; const Msg: String);
 begin
 case Stage of
   psStarting: gg.Progress := 0;
   psEnding:   gg.Progress := 100;
   psRunning:  gg.Progress := PercentDone;
 end;
 end;

 procedure TJPGA_Main.sbPrevClick(Sender: TObject);
 begin
 if sps.Items.Count = 0 then exit; if sps.ItemIndex > 0 then begin
 sps.ItemIndex:=sps.ItemIndex-1; jpegload(sps.ItemIndex,false);end;
 end;

 procedure TJPGA_Main.sbNextClick(Sender: TObject);
 begin
 if sps.Items.Count = 0 then exit;if sps.ItemIndex<sps.Items.Count-1 then
 begin sps.ItemIndex:=sps.ItemIndex+1; jpegload(sps.ItemIndex,false); end;
 end;

 function TJPGA_Main.ReadTextInFile(var Text:string):boolean;
 var b:byte;i,p:integer; s,m: string;f: file of byte;
 begin
 AssignFile(f,op.FileName);try Reset(f);Seek(f,FileSize(f)-6);SetLength(s,6);
 for i:=1 to Length(s)do begin Read(f,b);s[i]:=Char(Integer(Byte(b)));end;
 if s=TxtHeader then begin Seek(f,FileSize(f)-7);Read(f,b);p:=Integer(b);
 SetLength(s,p);Seek(f,FileSize(f)-(7+p));for i:=1 to Length(s) do begin
 Read(f,b);m:=IntToStr(b);s[i]:=m[1]; end;Seek(f,StrToInt(s));
 SetLength(s,FileSize(f)-(StrToInt(s)+7+p));
 for i:=1 to Length(s)do begin Read(f,b);s[i]:=chr(b);end;
 Text:=DeCrypt(s);Result:=true;end else Result:=false;finally CloseFile(f);end;
 end;

 procedure TJPGA_Main.sbOpenClick(Sender: TObject);
 begin
 If op.Execute then LoadJPGAlbumFile;
 end;

 procedure TJPGA_Main.JpegLoad(NumImage: integer; Mode: boolean);
 var j:tjpegimage;alb:tfilestream;flb:TMemoryStream;b,c:integer;
 begin
 alb:=TFileStream.Create(op.FileName,fmOpenRead);j:=tjpegimage.Create;
 j.OnProgress:=Image1Progress;if NumImage=0 then b:=0 else
 b:=strtoint(filelist.Strings[numImage-1]);
 c:=strtoint(filelist.Strings[numImage]);alb.Position:=b;
 flb:=TMemoryStream.Create;flb.CopyFrom(alb,c-b);flb.Position:=0;
 if Mode then flb.SaveToFile(sv.FileName);
j.LoadFromStream(flb);alb.Free;flb.Free;image1.Picture.Bitmap.Assign(j);j.Free;
 end;
 procedure TJPGA_Main.sbSaveClick(Sender: TObject);
 begin
 if sps.Items.Count=0 then exit;sv.FileName:=sps.Text+'.jpg';
 If sv.Execute then jpegload(sps.ItemIndex,true);
 end;

 procedure TJPGA_Main.LoadJPGAlbumFile;
 var s,g:string;i:integer;sw:boolean;
 begin
 FileList.Clear;sps.Clear;if ReadTextInFile(s) then begin
 Caption:='JPGAlbum - '+extractfilename(op.FileName);sw:= false;
 for i:=1 to Length(s) do if s[i] = #2 then begin if sw then begin
 sps.Items.Add('Фото '+inttostr(filelist.Count)+' - '+g);sw:=false;
 end else begin FileList.Add(g);sw:=true;end;
 g:='';end else begin g:=g+s[i];end;
 sps.Items.Add('Фото '+inttostr(filelist.Count)+' - '+g); end;
 if sps.Items.Count=0 then begin Panel1.Caption:=
 'Файл "'+extractfilename(op.FileName)+'" вероятно повреждён!';
 Image1.Picture.Assign(nil); sps.Enabled:=false;exit;end else begin
 sps.Enabled:=true;sps.ItemIndex:=0;jpegload(0,false);Panel1.Caption:='';end;
 end;

 Function RestoreLongName(fn:string):string;
  function LookupLongName(const filename:string):string;
  var sr:TSearchRec;
  begin
  if FindFirst(filename,faAnyFile,sr)=0 then Result:=sr.Name
  else Result:=ExtractFileName(filename);SysUtils.FindClose(sr);
  end;
   function GetNextFN: string;
   var i:integer;
   begin
   Result:='';if Pos('\\',fn)=1 then begin Result:='\\';
   fn:=Copy(fn,3,length(fn)-2);i:=Pos('\',fn);if i<>0 then begin
   Result:=Result+Copy(fn,1,i);fn:=Copy(fn,i+1,length(fn)-i);end;
   end;i:=Pos('\',fn);if i<>0 then begin Result:=Result+Copy(fn,1,i-1);
   fn:=Copy(fn,i+1,length(fn)-i);end else begin Result:=Result+fn;fn:='';end;
   end;
 Var name:string;
 Begin
  fn:=ExpandFileName(fn);Result:=GetNextFN;Repeat name:=GetNextFN;
  Result:=Result+'\'+LookupLongName(Result+'\'+name);Until length(fn)=0;
 End;

 procedure TJPGA_Main.FormShow(Sender: TObject);
 var s:string;i:integer;
 begin
 if ParamCount>0 then
 begin
 s:=ParamStr(1);for i:=2 to ParamCount do s:=s+' '+ParamStr(i);
op.FileName:=RestoreLongName(s);LoadJPGAlbumFile;end;sps.Width:=panel2.Width-5;
 end;
 procedure TJPGA_Main.spsChange(Sender: TObject);
 begin
 if sps.Items.Count=0 then exit;jpegload(sps.ItemIndex, false);
 end;
 procedure TJPGA_Main.FormResize(Sender: TObject);
 begin
 sps.Width:=panel2.Width-5;
 end;
end.
