program JPGAlbumCreator;

uses
  Forms,
  Mnf in 'Mnf.pas' {JpgAlbum};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'JPGAlbumCreator';
  Application.CreateForm(TJpgAlbum, JpgAlbum);
  Application.Run;
end.
