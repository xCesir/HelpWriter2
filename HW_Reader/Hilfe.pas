unit Hilfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, Printers;

type
  TRS_Hilfe = class(TForm)
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    ListBox1: TListBox;
    Splitter1: TSplitter;
    Label1: TLabel;
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    Label7: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    PrintDialog1: TPrintDialog;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    FontDialog1: TFontDialog;
    SpeedButton6: TSpeedButton;
    ColorDialog1: TColorDialog;
    SpeedButton7: TSpeedButton;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ListBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  RS_Hilfe: TRS_Hilfe;

procedure ZeigeHilfe(WohinSoll_CfgDatei,_Hilfedatei,Hilfethema: string);

implementation

{$R *.dfm}

uses
  RS_Math, rs_Util;

Type Datensatz = Record
       oben,
       links,
       beite,
       hoehe,
       ListboxBreite : integer;
       Fett,
       Kursiv,
       Unterstrichen,
       Durchgestrichen: Boolean;
       Schriftgroesse   : integer;
       Schrift,
       SchriftFarbe,
       Hintergrundfarbe : String[255];
     end;

var
  Datei          : File of Datensatz;
  satz           : Datensatz;
  Hilfedatei,
  AnwendungsdatenOrdner,
  Hilfe_ProgDir  : string;

procedure DatensatzStandard;
begin
  satz.oben := 0;
  satz.links := 0;
  satz.beite := 640;
  satz.hoehe := 420;
  satz.ListboxBreite := 200;
  satz.Fett := False;
  satz.Kursiv := False;
  satz.Unterstrichen := False;
  satz.Durchgestrichen := False;
  satz.Schriftgroesse := 8;
  satz.Schrift := 'Tahoma';
  satz.SchriftFarbe := ColorToString(clBlack);
  //satz.Hintergrundfarbe := ColorToString(clWindow);
  satz.Hintergrundfarbe := ColorToString($0080FFFF);
end;

procedure Dateicheck(Form2Dateiname : string);
var
  fehler : integer;
  mld    : string;
begin
  mld := 'Datei "'+Form2Dateiname+'" nicht gefunden.'+#10#13+#10#13+
         'Datei wird erstellt!';

  if not FileExists(Form2Dateiname) then
  begin
    MessageDlg(mld, mtInformation, [mbOk], 0);

    assignfile(datei,Form2Dateiname);
    {$I-}
    REWRITE(datei);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      DatensatzStandard;
      {$I-}
      Write(datei,satz);
      {$I+}
      Fehler := IoResult;
      if (fehler <> 0) then
      begin
        showmessage('In Datei "'+Form2Dateiname+ '" konnte nicht geschrieben werden!');
      end;
      {$I-}
      closefile(datei);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage('Datei "'+Form2Dateiname+'" konnte nicht geschlossen werden!');
      end;
    end
    else
    begin
      DatensatzStandard;
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht erzeugt werden.');
    end
  end
end;

procedure LeseDatei(Form2Dateiname : string);
var
  fehler : integer;
Begin
  AssignFile(datei,Form2Dateiname);
  {$I-}
  reset(datei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    {$I-}
    Read(datei,satz);
    {$I+}
    Fehler := IoResult;
    if (fehler <> 0) then
    begin
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht gelesen werden!');
      DatensatzStandard
    end;
    {$I-}
    closefile(datei);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht geschlossen werden!');
      DatensatzStandard;
    end;
  end
  else
  begin
    DatensatzStandard;
    showmessage('Datei "'+Form2Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;

procedure SchreibeDatei(Form2Dateiname : string);
var
  fehler : integer;
Begin
  AssignFile(datei,Form2Dateiname);
  {$I-}
  Rewrite(datei);
  {$I+}
  fehler := ioresult;
  if fehler = 0 then
  begin
    satz.oben := RS_Hilfe.Top;
    satz.links := RS_Hilfe.Left;
    satz.beite := RS_Hilfe.Width;
    satz.hoehe := RS_Hilfe.Height;
    satz.ListboxBreite := RS_Hilfe.ListBox1.Width;

    {$I-}
    Write(datei,satz);
    {$I+}
    Fehler := IoResult;
    if (fehler <> 0) then
    begin
      showmessage('In Datei "'+Form2Dateiname+'" konnte nicht geschrieben werden!');
    end;
    {$I-}
    closefile(datei);
    {$I+}
    if (ioresult <> 0) then
    begin
      showmessage('Datei "'+Form2Dateiname+'" konnte nicht geschlossen werden!');
    end;
  end
  else
  begin
    showmessage('Datei "'+Form2Dateiname+'" konnte nicht geöffnet werden!');
  end;
end;

procedure Positionen;
begin
  RS_Hilfe.Top := satz.oben;
  RS_Hilfe.Left := satz.links;
  RS_Hilfe.Width:= satz.beite;
  RS_Hilfe.Height:=satz.hoehe;
  RS_Hilfe.ListBox1.Width := satz.ListboxBreite;
end;

procedure BereiteAllesVor;
begin
  with RS_hilfe do
  begin
    Edit1.Text := '';
    memo1.Clear;
  end;
end;

procedure LeseDatenbank(Dateiname : string);
VAR
  f                 : textfile;
  zaehler,
  AnzZeilen,
  AnzahlDatensatz,
  fehler            : integer;
  TempZeile,
  zeile             : String;
  Minizeile         : String[1];
begin
  Dateiname := _LastLeerEntf(Dateiname);
  if Dateiname = '' then
  begin
    Showmessage('Kein gültiger Dateiname!'+#10#13+Dateiname);
    exit;
  end;
  with RS_Hilfe do
  begin
    AnzZeilen := 0;
    AnzahlDatensatz := 0;
    zaehler := 0;
    listbox1.Clear;
    memo1.Clear;
    BereiteAllesVor;;
    statusbar1.SimpleText := Dateiname;
    AssignFile(f,Dateiname);
    {$I-}
    reset(f);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      //ButtonAnAus(false);
      Screen.cursor := crHourGlass;
      listbox1.Items.BeginUpdate;
      while not eof(f)do
      begin
        inc(zaehler);
        if zaehler = 100000 then
        begin
          //Nur das Prog sich bein einlesen mal meldet
          Application.Processmessages;
          zaehler := 0;
        end;
        inc(AnzZeilen);
        zeile := '';
        Readln(f,zeile);
        Tempzeile := zeile;
        Minizeile := zeile;
        Tempzeile := RS_upcase(Tempzeile);
        if (Minizeile = '#') and (Tempzeile <> '#END') then
        begin
          inc(AnzahlDatensatz);
          delete(zeile,1,1);
          listbox1.Items.Add(zeile)
        end;
      end;
      Screen.cursor := crDefault;
      //ButtonAnAus(true);
      listbox1.Items.EndUpdate;
      label7.Caption := 'Anzahl Hilfethemen in der Datei: '+RS_inttostr(AnzahlDatensatz);
      label9.Caption := RS_inttostr(AnzZeilen);
      {$I-}
      closefile(f);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage(Dateiname+#10#13+'Datei konnte nicht geschlossen werden!');
      end;
    end
    else showmessage(Dateiname+#10#13+'Datei konnte nicht geöffnet werden!');
  end;
end;


procedure LeseDatensatz(Dateiname, Datensatz : string);
VAR
  f                 : textfile;
  i, 
  fehler            : integer;
  TempZeile,
  zeile             : String;
  gefunden          : Boolean;
  minizeile         : string[1];
begin
  Dateiname := _LastLeerEntf(Dateiname);
  if Dateiname = '' then
  begin
    Showmessage('Kein gültiger Dateiname!'+#10#13+Dateiname);
    exit;
  end;
  with RS_Hilfe do
  begin
    i := 0;
    memo1.Clear;
    BereiteAllesVor;

    gefunden := false;
    AssignFile(f,Dateiname);
    {$I-}
    reset(f);
    {$I+}
    fehler := ioresult;
    if fehler = 0 then
    begin
      //ButtonAnAus2(false);
      Screen.cursor := crHourGlass;
      Datensatz := '#'+Datensatz;

      memo1.Lines.BeginUpdate;
      while not eof(f)do
      begin
        inc(i);
        zeile := '';
        Readln(f,zeile);
        Tempzeile := zeile;
        Tempzeile := RS_upcase(Tempzeile);
        Datensatz := RS_Upcase(Datensatz);
        if (Datensatz = Tempzeile) then
        begin
          gefunden := true;
          //label3.Caption := RS_IntToStr(i);
        end;
        if (gefunden = true) then
        begin
          if (Tempzeile = '#END') then
          begin
            gefunden := false;
            //label5.Caption := RS_IntToStr(i);
          end;
          minizeile := zeile;

          if (minizeile <> '#') then memo1.Lines.Add(zeile);

        end;
      end;
      memo1.Lines.EndUpdate;

      Memo1.Perform(EM_LineScroll, 0 , -Memo1.Lines.Count-1);
      Screen.cursor := crDefault;
      //ButtonAnAus2(true);
      label9.Caption := Inttostr(i);
      {$I-}
      closefile(f);
      {$I+}
      if (ioresult <> 0) then
      begin
        showmessage(Dateiname+#10#13+'Datei konnte nicht geschlossen werden!');
      end
    end
    else showmessage(Dateiname+#10#13+'Datei konnte nicht geöffnet werden!');
  end;
  Screen.cursor := crDefault;
  //ButtonAnAus2(true);
end;

procedure ZeigeHilfe(WohinSoll_CfgDatei,_Hilfedatei,Hilfethema: string);
var
  TempString,
  ListboxString : String;
  gefunden      : Boolean;
  i             : integer;
begin
  AnwendungsdatenOrdner := WohinSoll_CfgDatei;

  Hilfe_ProgDir:=ExtractFilePath(ParamStr(0));
  if RS_HasBackSlash(Hilfe_ProgDir) = false then
     Hilfe_ProgDir := Hilfe_ProgDir + '\';

  Dateicheck(AnwendungsdatenOrdner+'Hilfe.cfg');
  LeseDatei(AnwendungsdatenOrdner+'Hilfe.cfg');

  RS_Hilfe.Memo1.Font.Name := satz.Schrift;
  RS_Hilfe.Memo1.Font.Size := satz.Schriftgroesse;
  RS_Hilfe.memo1.color := StringToColor(satz.Hintergrundfarbe);

  if (satz.fett = true) then
  RS_Hilfe.memo1.font.style := RS_Hilfe.memo1.font.style + [fsBold];
  if (satz.Kursiv = true) then
  RS_Hilfe.memo1.font.style := RS_Hilfe.memo1.font.style + [fsItalic];
  if (satz.Unterstrichen = true) then
  RS_Hilfe.memo1.font.style := RS_Hilfe.memo1.font.style + [fsUnderline];
  if (satz.Durchgestrichen = true) then
  RS_Hilfe.memo1.font.style := RS_Hilfe.memo1.font.style + [fsStrikeout];
  RS_Hilfe.Memo1.Font.Color := StringToColor(satz.SchriftFarbe);

  RS_Hilfe.listbox1.Font := RS_Hilfe.memo1.font;
  RS_Hilfe.edit1.Font := RS_Hilfe.memo1.Font;

  Positionen;

  Hilfedatei := '';   
  Hilfedatei := _Hilfedatei;
  LeseDatenbank(Hilfe_ProgDir+Hilfedatei);
  ListboxString := Hilfethema;
  if ListboxString <> '' then
  begin
    gefunden := false;
    i := -1;

    if RS_Hilfe.ListBox1.Items.Count > 0 then
    begin
      repeat
        inc(i);
        TempString := RS_Hilfe.ListBox1.Items[i];
        ListboxString := rs_upcase(ListboxString);
        TempString  := rs_upcase(TempString);
        if ListboxString = TempString then
        gefunden := true;
      until (i = (RS_Hilfe.listbox1.Items.Count - 1)) or (gefunden = true);
    end
    else showmessage('Hilfedatei enthält keine Einträge!');
    
    if gefunden = true then
    begin
      //showmessage('I = '+inttostr(i));
      IF RS_Hilfe.listbox1.Items.Count > 0 then
      begin
        RS_Hilfe.Listbox1.Selected[i]:=True;
        RS_Hilfe.ListBox1Click(RS_Hilfe);
      end
    end
    else MessageDlg('Hilfethema nicht gefunden!', mtError, [mbOk], 0);
  end;
  RS_Hilfe.ActiveControl := RS_Hilfe.memo1;
end;

procedure TRS_Hilfe.FormCreate(Sender: TObject);
begin
  BereiteAllesVor;
end;

procedure TRS_Hilfe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SchreibeDatei(AnwendungsdatenOrdner+'Hilfe.cfg');
end;

procedure TRS_Hilfe.ListBox1Click(Sender: TObject);
var
  was : string;
begin
  was := ListBox1.Items[listbox1.itemindex];
  LeseDatensatz(Hilfedatei,was);
  ActiveControl := memo1;
end;

procedure SucheHilfeThema;
var
  i : integer;
  f : Textfile;
  (* Ab hier für Suchroutine *)
  zeile,
  upzeile,
  SuchQual,
  such     : String[255];
  gefunden : Boolean;
  iii  : Integer;
  kurzzeile : string[1];

procedure _Suchwort(wort_laenge : INTEGER);
VAR
 b        : INTEGER;
 Auftragg : String;
BEGIN
 Auftragg := '';
 IF wort_laenge > 0 THEN
 BEGIN
   FOR b := 1 TO wort_laenge DO
   BEGIN
     Auftragg := Auftragg + SuchQual[b];
     IF Auftragg = Such
     THEN gefunden := TRUE
     ELSE gefunden := FALSE
   END
 END
 ELSE gefunden := FALSE;
// if gefunden = true then inc(wieviele);
END;

begin
  if RS_Hilfe.edit1.text <> '' then
  begin
    if Hilfedatei = '' then exit;
    //label10.caption := '-1';
    RS_Hilfe.listbox1.clear;
    RS_Hilfe.memo1.Clear;

    assignfile(f,Hilfedatei);
    {$I-}
    reset(f);
    {$I+}
    if ioresult = 0 then
    begin
      //buttonanaus(false);
      Screen.cursor := crHourGlass;
      RS_Hilfe.listbox1.Items.BeginUpdate;
      while not eof(f) do
      begin
        zeile := '';
        readln(f,zeile);
        upzeile := zeile;
        for i := 1 to Length(upzeile) do upzeile[i] := UpCase(upzeile[i]);
        kurzzeile := zeile;
        if kurzzeile = '#' then
        begin
          if (upzeile <> '#END') then
          begin
            delete(zeile,1,1);
            such := RS_Hilfe.edit1.text;
            suchqual := zeile;
            such := rs_upcase(such);
            suchqual := rs_upcase(suchqual);
            FOR iii := 1 TO LENGTH(Such) DO _Suchwort(iii);

            IF (SuchQual = such) OR (Gefunden = TRUE) THEN
            BEGIN
              try
                RS_Hilfe.listbox1.Items.Add(zeile);
              except
              end
            end;
          end;
        end;
      end;
      RS_Hilfe.listbox1.Items.EndUpdate;
      closefile(f);
      Screen.cursor := crDefault;
      //buttonanaus(true);
    end
    else Showmessage('Datei konnte nicht geöffnet werden!');
  end
  else
  begin
    showmessage('Eingabe erforderlich!');
    RS_Hilfe.activecontrol := RS_Hilfe.edit1;
  end;
  Screen.cursor := crDefault;
  //buttonanaus(true);
end;



procedure TRS_Hilfe.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  rsx_Stg : String;
begin
  if key = #13 then
  begin
    rsx_Stg := edit1.text;
    rsx_Stg := _Lastleerentf(rsx_Stg);
    if rsx_Stg <> '' Then SucheHilfeThema
                     else
                     begin
                       LeseDatenbank(Hilfe_ProgDir+Hilfedatei);
                       Activecontrol := edit1;
                       showmessage('Eingabe erforderlich!');
                     end;
    key := #0;
  end;
end;

procedure TRS_Hilfe.SpeedButton3Click(Sender: TObject);
begin
  close;
end;

procedure TRS_Hilfe.SpeedButton2Click(Sender: TObject);
begin
  ActiveControl := memo1;
  memo1.SelectAll;
  memo1.CopyToClipboard;
end;

procedure TRS_Hilfe.SpeedButton1Click(Sender: TObject);
var
   Geschriebenes,Zeile,maxtext:word;
begin
   //Falls der Druckdialog mit 'Ok' bestätigt wird...
   If Printdialog1.execute then begin
      //Setze den Title des Druckauftragen auf den Dateinamen
      Printer.title:='HW Adress';;
      //Fange mit der Aufzeichnung der Befehle an

      (*
      Printer.Canvas.Font.size := 10;
      Printer.Orientation := poPortrait;
      Printer.Canvas.Font.name := 'Courier New';
      Printer.Canvas.Font.Pitch := fpFixed;
      *)
      Printer.Canvas.Font := Memo1.Font;
      Printer.Orientation := poPortrait;

      Printer.begindoc;
      //Setze Variblen auf genz oben
      Zeile:=0;
      Geschriebenes:=0;
      //Solange wir die Anzahl der Memo-Zeilen nicht überschritten haben...
      while Zeile<Memo1.lines.count do begin
         //Gebe den Text der Aktuellen Zeile aus
         //mit: Abstand von links: 50
         //mit: Abstand von oben: 50 + Bisher geschriebenes
         Printer.Canvas.Textout(250,50+geschriebenes,Memo1.lines[Zeile]);
         //Ergänze den Bisher geschribenen Text um dei letzte Zeile
         maxtext:=Printer.canvas.TextHeight(Memo1.Lines[Zeile]);
         inc(Geschriebenes,maxtext);
         //Falls die Seite voll ist (50 oben, 50 unten)...
         If Geschriebenes >=Printer.Pageheight-100 then begin
            //Fange eine neue Seite an
            printer.newpage;
            //Setze das bisher geschriebene auf 0
            geschriebenes:=0;
            end;
         //Nächste Zeile im Memo
         inc(Zeile);
         end;
      //Beendet das Formular
      Printer.enddoc;
      end;
end;

procedure TRS_Hilfe.SpeedButton4Click(Sender: TObject);
begin
  LeseDatenbank(Hilfe_ProgDir+Hilfedatei);
end;

procedure TRS_Hilfe.SpeedButton5Click(Sender: TObject);
var
  rsx_Stg: string;
begin
  rsx_Stg := edit1.text;
  rsx_Stg := _Lastleerentf(rsx_Stg);
  if rsx_Stg <> '' Then SucheHilfeThema
                   else
                   begin
                     LeseDatenbank(Hilfe_ProgDir+Hilfedatei);
                     Activecontrol := edit1;
                     showmessage('Eingabe erforderlich!');
                   end;
end;

procedure TRS_Hilfe.SpeedButton6Click(Sender: TObject);
var
  TempString,
  listboxstring : string;
  gefunden : Boolean;
  i : integer;

begin
  FontDialog1.Font := memo1.Font;
  if fontdialog1.execute then
  begin
    memo1.font:=fontdialog1.font;

    if memo1.Font.Size > 16 then memo1.Font.Size := 16;
    if memo1.Font.Size < 8 then memo1.Font.Size := 8;

    listbox1.Font := memo1.font;
    edit1.Font := memo1.Font;

    satz.Schriftgroesse := memo1.Font.Size;
    satz.Schrift := memo1.Font.Name;
    satz.Schriftfarbe := ColorToString(memo1.font.Color);

    if fsBold in  memo1.font.style then
    satz.Fett := true else satz.fett := false;
    if fsItalic in  memo1.font.style then
    satz.Kursiv := true else satz.Kursiv := false;
    if fsUnderline in  memo1.font.style then
    satz.Unterstrichen := true else satz.Unterstrichen := false;
    if fsStrikeout in  memo1.font.style then
    satz.Durchgestrichen := true else satz.Durchgestrichen := false;

    //edit1.Text := ColorToString(memo1.font.Color);

    ListboxString := ListBox1.Items[listbox1.itemindex];
    LeseDatenbank(Hilfe_ProgDir+Hilfedatei);

    if ListboxString <> '' then
    begin
      gefunden := false;
      i := -1;

      if ListBox1.Items.Count > 0 then
      begin
        repeat
          inc(i);
          TempString := ListBox1.Items[i];
          if ListboxString = TempString then
          gefunden := true;
        until (i = (listbox1.Items.Count - 1)) or (gefunden = true);
      end;

      if gefunden = true then
      begin
        //showmessage('I = '+inttostr(i));
        IF listbox1.Items.Count > 0 then
        begin
          Listbox1.Selected[i]:=True;
          ListBox1Click(RS_Hilfe);
        end
      end
      else showmessage('Eintrag "'+ListboxString+'" nicht gefunden!');
    end;
  end
end;

procedure TRS_Hilfe.SpeedButton7Click(Sender: TObject);
begin
  ColorDialog1.Color := memo1.Color;
  if ColorDialog1.execute then
  begin
    memo1.color:=ColorDialog1.color;
    satz.Hintergrundfarbe := ColorToString(memo1.color);

    //edit1.Text := ColorToString(memo1.Color);
  end;  
end;

end.
