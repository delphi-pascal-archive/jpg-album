program JPGAlbumRider;

uses
  Forms,
  Rider in 'Rider.pas' {JPGA_Main};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'JPGAlbumRider';
  Application.CreateForm(TJPGA_Main, JPGA_Main);
  Application.Run;
end.
