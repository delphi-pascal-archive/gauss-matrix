program gaussP;

uses
  Forms,
  gauss in 'gauss.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'gauss_equation';
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
