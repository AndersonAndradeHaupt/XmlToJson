program XmlToJson;

uses
  Vcl.Forms,
  Udemo in 'Udemo.pas' {Form1},
  SimpleXMLToJSONReader in 'SimpleXMLToJSONReader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
