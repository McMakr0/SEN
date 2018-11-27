program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  { you can add units after this };

type

  { TMyApplication }

  TMyApplication = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

{ TMyApplication }

procedure TMyApplication.DoRun;
var
  ErrorMsg: String;
begin
  // quick check parameters
  ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;

  // parse parameters
  if HasOption('h', 'help') then begin
    WriteHelp;
    Terminate;
    Exit;
  end;

  { add your program here }

  // stop program loop
  Terminate;
end;

constructor TMyApplication.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TMyApplication.Destroy;
begin
  inherited Destroy;
end;

procedure TMyApplication.WriteHelp;
begin
  { add your help code here }
  writeln('Usage: ', ExeName, ' -h');
end;

var
  Application: TMyApplication;
  z:array[1..100] of string;
  p,c: string;
  zoznam: TextFile;
  a,b,e,f,g: integer;
  d:boolean;
begin
  readln(c);
  a:=0;
  b:=0;
  e:=0;
  f:=0;
  d:=false;
  assignfile(zoznam,'C:\Users\Dell\Desktop\SEN\Zoznam.txt');
  reset(zoznam);
  repeat
        f:=f+1;
        readln(zoznam,p);
        z[f]:=p;
  until eof(zoznam);
  a:=f;
  b:=0;
  repeat
        e:=e+1;
        g:=((a+b) div 2);
        if (g = a) or (g = b )then d:=true;
        if z[g] <> c then begin if  z[g] < c  then b:=g else a:=g end else begin d:=true; writeln('je tu') end;

        if e=(f) then begin writeln('nie je tu');d:=true; end;


  until d=true;


                readln;

end.

