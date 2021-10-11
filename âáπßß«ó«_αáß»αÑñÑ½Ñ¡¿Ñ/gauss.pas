unit gauss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,math;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    pi: TEdit;
    e: TEdit;
    s: TEdit;
    matrix: TMemo;
    Label7: TLabel;
    xto: TEdit;
    Image3: TImage;
    CheckBox1: TCheckBox;
    multto: TEdit;
    Label8: TLabel;
    procedure eKeyPress(Sender: TObject; var Key: Char);
    procedure sKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure xtoKeyPress(Sender: TObject; var Key: Char);
    procedure piKeyPress(Sender: TObject; var Key: Char);
    procedure multtoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  mat: array of real;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var piV,eV,sigmav,multtov:real;
    xtoV,x,ys:integer;
    xy:tpoint;


begin
  if pi.Text='' then MessageDlg('¬ведите параметры',mtError, mbOKCancel, 0);
  if e.Text='' then MessageDlg('¬ведите параметры',mtError, mbOKCancel, 0);
  if s.Text='' then MessageDlg('¬ведите параметры',mtError, mbOKCancel, 0);
  if xto.Text='' then MessageDlg('¬ведите параметры',mtError, mbOKCancel, 0);
  if multto.Text='' then MessageDlg('¬ведите параметры',mtError, mbOKCancel, 0);

  piv:=strtofloat(pi.Text);
  ev:=strtofloat(e.Text);
  sigmav:=strtofloat(s.Text);
  xtov:=strtoint(xto.Text);
  multtov:=strtofloat(multto.Text);

  if not (mat=nil) then mat:=nil;
  matrix.Text:='';

  setlength(mat,xtov+1);

  for x := 0 to xtov do  begin
  mat[x]:=1/( sqrt(2*piv) * sigmav ) * power(
  ev,
  (
  -1*( sqr(x)/(2*sqr(sigmav)))
  )
  );

  if checkbox1.Checked=true then
  matrix.Lines.Add(inttostr(x)+').  '+floattostr(roundto(mat[x]*multtov,-1)))
   else
  matrix.Lines.Add(inttostr(x)+').  '+floattostr(mat[x]*multtov));
  end;



  //graph paint




with image3.Canvas do begin
Brush.Color:=form2.Color;
Pen.Width:=1;

FloodFill(2,2,form2.Color, fsborder);
pen.Color:=clblack;
MoveTo(30,10);
LineTo(30,465);

MoveTo(30,10);
LineTo(25,30);

MoveTo(30,10);
LineTo(35,30);

MoveTo(10,440);
LineTo(468,440);

MoveTo(468,440);
LineTo(448,435);

MoveTo(468,440);
LineTo(448,445);

TextOut(0,10,'G(x)');
TextOut(468,445,'x');

TextOut(20,445,'0');

 brush.Color:=clred;

moveto(30,40);
 Pen.Color:=clred;

 xy.X:=30;
 xy.Y:=40;

 ellipse(xy.X-3,xy.Y-3,xy.X+3,xy.Y+3);



 brush.Color:=form2.Color;
 textout(xy.x+10, xy.Y, inttostr(xy.X-30)+','+inttostr(440-xy.Y));
brush.Color:=clred;
  moveto(30,40);









 for x := 1 to xtov do begin
 ys:=round((400*mat[x])/mat[0]);
 lineto(round(30+(400/xtov)*x),438-ys);
 Pen.Color:=clred;

 xy.X:=round(30+(400/xtov)*x);
 xy.Y:=438-ys;

 ellipse(xy.X-3,xy.Y-3,xy.X+3,xy.Y+3);


 brush.Color:=form2.Color;
 textout(xy.x+10, xy.Y-20, inttostr(xy.X-30)+','+inttostr(440-xy.Y));
 brush.Color:=clred;
 moveto(round(30+(400/xtov)*x),438-ys);


 end;

end;





end;

procedure TForm2.eKeyPress(Sender: TObject; var Key: Char);
begin
 if  not (key in  ['0'..'9', ',' ,#8])   then key:=chr(0);
end;



procedure TForm2.multtoKeyPress(Sender: TObject; var Key: Char);
begin
if  not (key in  ['0'..'9', ',',#8])   then key:=chr(0);
end;

procedure TForm2.piKeyPress(Sender: TObject; var Key: Char);
begin
 if  not (key in  ['0'..'9', ',',#8])   then key:=chr(0);
end;

procedure TForm2.sKeyPress(Sender: TObject; var Key: Char);
begin
 if  not (key in  ['0'..'9', ',',#8])   then key:=chr(0);
end;

procedure TForm2.xtoKeyPress(Sender: TObject; var Key: Char);
begin
    if  not (key in  ['0'..'9',#8])   then key:=chr(0);
end;

end.
