unit LeseKonfig;

interface

uses
  Dialogs;

function xLeseKonfigdatei(Dateiname: String) : Boolean;
function xPasswortLeseDatei(Dateiname: string) : Boolean;

Type KonfigDatensatz = Record
       EigenerOrdnerSpeichern : Boolean;
     end;

Type PasswortDatensatz = Record
       Neuespasswort          : String[50];
     end;

var
  KonfigDatei                 : File of KonfigDatensatz;
  Konfigsatz                  : KonfigDatensatz;
  PasswortDatei               : file of PasswortDatensatz;
  Passwortsatz                : PasswortDatensatz;

implementation

procedure KonfigDateiStandard;
begin
  Konfigsatz.EigenerOrdnerSpeichern := true;
end;

function xLeseKonfigdatei(Dateiname: String) : Boolean;
var
  fehler: integer;
Begin
  AssignFile(Konfigdatei,Dateiname);
  {$I-}
  reset(Konfigdatei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    Read(Konfigdatei,konfigsatz);
    {$I+}
    if IoResult <> 0 then
    begin
      KonfigDateiStandard;
      showmessage('Datei Lesefehler!'+#10#13+Dateiname);
      xLeseKonfigdatei := false;
    end
    else xLeseKonfigdatei := true;

    {$I-}
    closefile(Konfigdatei);
    {$I+}
    if (ioresult <> 0) then
    begin
      KonfigDateiStandard;
      showmessage('Datei '+Dateiname+' konnte nicht geschlossen werden!');
      xLeseKonfigdatei := false;
    end;
  end
  else
  begin
    KonfigDateiStandard;
    showmessage('Datei '+Dateiname+' konnte nicht geöffnet werden!');
    xLeseKonfigdatei := false;
  end;
end;


procedure PasswortDateiStandard;
begin
  Passwortsatz.Neuespasswort := '';
end;

function xPasswortLeseDatei(Dateiname: string) : Boolean;
var
  fehler : integer;
begin
  AssignFile(passwortdatei,dateiname);
  {$I-}
  reset(passwortdatei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    Read(passwortdatei,passwortsatz);
    {$I+}
    if (ioresult <> 0) then
    begin
      PasswortDateiStandard;
      showmessage('Datei "'+dateiname+'" Schreibfehler!');
      xPasswortLeseDatei := false;
    end
    else xPasswortLeseDatei := true;

    {$I-}
    closefile(passwortdatei);
    {$I+}
    if (ioresult <> 0) then
    begin
      xPasswortLeseDatei := false;
      PasswortDateiStandard;
      showmessage('Datei "'+Dateiname+'" konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    xPasswortLeseDatei := false;
    PasswortDateiStandard;
    showmessage('Datei "'+Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;

end.
