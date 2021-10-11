unit Mnf;

interface

uses Windows,SysUtils,Classes,Controls,Forms,ExtCtrls,StdCtrls,Messages,
  ComCtrls,XPMan,ImgList,jpeg,Buttons,Graphics,ExtDlgs,Dialogs,Gauges;

  type
  TJpgAlbum=class(TForm)
  ImageList:TImageList;Panel1:TPanel;Panel2:TPanel;Panel3:TPanel;Image1:TImage;
  Splitter1:TSplitter;sbOpen:TSpeedButton;sbSave:TSpeedButton;
  sbFileDel:TSpeedButton;sbClear:TSpeedButton;sbFileDown:TSpeedButton;
  sbFileUp:TSpeedButton;sbEditName:TSpeedButton;tv:TTreeView;
  XPManifest1:TXPManifest;OP:TOpenPictureDialog;Sv:TSaveDialog;gg:TGauge;

    procedure JPEGLoad(ds : TTreeNode);
    procedure DelNode;
    procedure tbOpenClick(Sender : TObject);
    procedure tvExpanding(Sender : TObject; Node : TTreeNode;
                               var AllowExpansion : Boolean);
    procedure tvContextPopup(Sender : TObject; MousePos : TPoint;
                                          var Handled : Boolean);
    procedure sbFileDelClick(Sender : TObject);
    procedure tvChange(Sender : TObject; Node : TTreeNode);
    procedure sbFileUpMouseDown(Sender : TObject; Button : TMouseButton;
                           Shift : TShiftState; X, Y : Integer);
    procedure sbFileDownMouseDown(Sender : TObject; Button : TMouseButton;
                           Shift : TShiftState; X, Y : Integer);
    procedure Image1Progress(Sender : TObject; Stage : TProgressStage;
    PercentDone : Byte; RedrawNow : Boolean;
    const R : TRect; const Msg : String);
    procedure sbClearMouseDown(Sender : TObject; Button : TMouseButton;
                               Shift : TShiftState; X, Y : Integer);
    procedure sbSaveClick(Sender : TObject);
    procedure tvKeyDown(Sender : TObject; var Key : Word; Shift : TShiftState);
    procedure tvKeyUp(Sender: TObject; var Key : Word; Shift : TShiftState);
    procedure sbEditNameClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  var JpgAlbum : TJpgAlbum;flg : boolean;

    implementation

  uses  XorCrypt;

  const TxtHeader:string = #$29#$06#$09#$04#$FF#$D9;

  {$R *.dfm}
  procedure TJpgAlbum.tbOpenClick(Sender: TObject);
var k:TTreeNode;n:integer;
begin
 If op.Execute then begin with tv do begin Items.BeginUpdate;
 Application.ProcessMessages;for n:=0 to (op.Files.Count-1) do begin
k:=Items.Add(tv.Selected,ChangeFileExt(ExtractFileName(op.Files[n]),''));
Items.AddChild(k,op.Files[n]);end;tv.Items.EndUpdate;end;flg:=false;
if tv.Selected=nil then tv.Items.GetFirstNode.Selected:=true;
panel1.Caption:='';sbSave.AllowAllUp:=false;end;
end;

 procedure TJpgAlbum.tvExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
  begin
AllowExpansion := false;
 end;

 procedure TJpgAlbum.tvContextPopup(Sender: TObject;
                      MousePos: TPoint; var Handled: Boolean);
 var tmpNode:TTreeNode;
begin
  tmpNode:=(Sender as TTreeView).GetNodeAt(MousePos.X,MousePos.Y);
  if tmpNode<>nil then TTreeView(Sender).Selected:=tmpNode;
 end;

 procedure TJpgAlbum.sbFileDelClick(Sender: TObject);
begin
DelNode;
end;

procedure TJpgAlbum.tvChange(Sender: TObject; Node: TTreeNode);
begin
JPEGLoad(Node);
end;

procedure TJpgAlbum.sbFileUpMouseDown(Sender: TObject;
  Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
var s1,s2,d1,d2:string;
begin
if (tv.Selected=nil) or (tv.Selected.AbsoluteIndex=0) then exit else
 begin with tv.Selected do begin flg:=true;if EditText then EndEdit(false);
 s1:=GetPrevVisible.Text;s2:=GetPrevVisible.GetLastChild.Text;d1:=Text;
 d2:=GetLastChild.Text;Text:=s1;GetLastChild.Text:=s2;GetPrevVisible.Text:=d1;
 GetPrevVisible.GetLastChild.Text:=d2;GetPrevVisible.Selected:=true;end;
 flg:=false; end;
end;

procedure TJpgAlbum.sbFileDownMouseDown(Sender: TObject;
    Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
var s1,s2,d1,d2:string;
begin
 if(tv.Selected=nil)or((tv.Selected.AbsoluteIndex+2)=tv.Items.Count)then exit
 else begin flg:=true;with tv.Selected do begin if EditText then EndEdit(false);
 s1:=GetNextVisible.Text;s2:=GetNextVisible.GetLastChild.Text;d1:=Text;
 d2:=GetLastChild.Text;Text:=s1;GetLastChild.Text:=s2;GetNextVisible.Text:=d1;
 GetNextVisible.GetLastChild.Text:=d2;GetNextVisible.Selected:=true;end;
 flg:=false;end;
end;

procedure TJpgAlbum.Image1Progress(Sender: TObject;Stage:TProgressStage;
    PercentDone:Byte;RedrawNow:Boolean; const R: TRect; const Msg: String);
begin
case Stage of
psStarting: gg.Progress:=0;
psEnding: gg.Progress:=100;
psRunning: gg.Progress:=PercentDone;end;
end;

procedure TJpgAlbum.DelNode;
begin
if sbSave.AllowAllUp then exit;
if tv.Selected<>nil then tv.Items.Delete(tv.Selected);if tv.Selected=nil then
 begin Image1.Picture:=nil;panel1.Caption:='Пусто';sbSave.AllowAllUp:=true;
gg.Progress:=100;end;
end;

procedure TJpgAlbum.sbClearMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if sbSave.AllowAllUp then exit;flg:=true;Image1.Picture.Assign(nil);
gg.Progress:=100;tv.Items.Clear;panel1.Caption:='Пусто';sbSave.AllowAllUp:=true;
end;

procedure TJpgAlbum.sbSaveClick(Sender: TObject);
var alb,flb:TFileStream;i:integer;s,g:string;l:char;
begin
if sbSave.AllowAllUp then exit;If sv.Execute then begin tv.Enabled:=false;
flg:=true;tv.Items.GetFirstNode.Selected:=true;Application.ProcessMessages;
alb:=TFileStream.Create(sv.filename,fmCreate);s := '';
gg.MaxValue:=(tv.Items.Count div 2)-1;gg.Progress:=0;
try for i:=0 to(tv.Items.Count div 2)-1 do begin
flb := TFileStream.Create(tv.Selected.GetLastChild.Text,fmOpenRead);
 try alb.CopyFrom(flb,0);s:=s+#2+inttostr(alb.Position)+#2+tv.Selected.Text;
 if i<(tv.Items.Count div 2)-1 then tv.Selected.GetNextVisible.Selected:=true;
gg.Progress:=i; finally flb.Free;end;end;g:=IntToStr(alb.Size);Delete(s,1,1);
 for i:=1 to Length(g) do begin l:=Chr(StrToInt(g[i]));g[i]:=l;end;
 s:=EnCrypt(s)+g+Chr(Length(g))+TxtHeader;alb.Write(pointer(s)^,length(s));
 finally alb.Free; end;tv.Enabled:=true;flg:=false;end;
  end;

  procedure TJpgAlbum.tvKeyDown(Sender:TObject;var Key:Word;Shift:TShiftState);
begin
flg:=true;
end;

procedure TJpgAlbum.tvKeyUp(Sender: TObject;var Key:Word;Shift:TShiftState);
begin
flg:=false;case Key of
 33..36,38,40: if not tv.IsEditing then JPEGLoad(tv.Selected);
 113: tv.Selected.EditText;
 46 : if not tv.IsEditing then DelNode;end;
 end;

 procedure TJpgAlbum.JPEGLoad(ds: TTreeNode);
var j:tjpegimage;
begin
if flg then exit;if tv.Selected <> nil then begin j:=tjpegimage.Create;
j.OnProgress:=Image1Progress;j.LoadFromFile(ds.GetLastChild.Text);
 Application.ProcessMessages;image1.Picture.Bitmap.Assign(j);j.Free;end;
end;

procedure TJpgAlbum.sbEditNameClick(Sender: TObject);
begin
if sbSave.AllowAllUp then exit; tv.Selected.EditText;
end;

end.
