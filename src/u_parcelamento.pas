unit u_parcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, Grids, DBGrids, DateUtils, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    ClientDataSet1: TFDMemTable;
    ClientDataSet1parcela: TIntegerField;
    ClientDataSet1vencimento: TDateTimeField;
    ClientDataSet1valor_parcela: TCurrencyField;
    ClientDataSet1n_parcela: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
   Data: TDateTime;
   ParcVenc: String;
   I, NP, NPPos: Integer;
   Parcela, Resto: Currency;
   NParcelas: Array[1..500] of Currency;
   DTDaysParcelas: Array[1..500] of String;
   Total: Currency;
   ValorParc: String;
begin
      ClientDataSet1.Open;
      Data := DateTimePicker1.DateTime;
      ParcVenc := Edit1.Text;//'25/35/42';
      NP := 0;
      Total := StrToCurr(Edit3.Text);
      // Percorre os vencimentos
      for I := 0 to Length(ParcVenc) do
      begin
           NPPos := Pos('/', ParcVenc);
           if Pos('/', ParcVenc) > 0 then
           begin
                Inc(NP);
                DTDaysParcelas[NP] := Copy(ParcVenc, 1, NPPos-1);
                Delete(ParcVenc, 1, NPPos);
           end;
      end;
      // Como sobra mais um copia este..
      if Length(ParcVenc) > 0 then
      begin
           Inc(NP);
           DTDaysParcelas[NP] := ParcVenc;
      end;

      // Determina a parcela
      Parcela := Total/NP;
      // Limita a precisão em dois digitos.. Delphi 3
      Parcela := StrToFloat(FormatFloat('#,###.00', Parcela));
      // Pega o resto e joga na última parcela
      Resto := Total - (Parcela*NP);
      // Percorre as parcelas
      for I := 1 to NP do
      begin
           Data := Date + StrToInt(DTDaysParcelas[I]);
           ValorParc := FloatToStr(Parcela);
           if I < NP then
           begin
                ValorParc := FloatToStr(Parcela);
                ListBox1.Items.Add(FormatFloat('0.00',Parcela)+' - '+DateToStr(Data) + ' - ' + DTDaysParcelas[I] + ' Dias');
                ClientDataSet1.Append;
                ClientDataSet1parcela.AsInteger := StrToInt(DTDaysParcelas[I]);
                ClientDataSet1vencimento.AsDateTime := Data;
                ClientDataSet1valor_parcela.AsFloat := Parcela;
                ClientDataSet1n_parcela.AsString    := IntToStr(I) + 'º';
                ClientDataSet1.Post;
           end
           else
           begin
                Parcela := Parcela + Resto;
                ListBox1.Items.Add(FormatFloat('0.00',Parcela)+' - '+DateToStr(Data) + ' - ' + DTDaysParcelas[I] + ' Dias');
                ClientDataSet1.Append;
                ClientDataSet1parcela.AsInteger := StrToInt(DTDaysParcelas[I]);
                ClientDataSet1vencimento.AsDateTime := Data;
                ClientDataSet1valor_parcela.AsFloat := Parcela;
                ClientDataSet1n_parcela.AsString    := IntToStr(I) + 'º';
                ClientDataSet1.Post;
           end;
      end;

      ListBox1.Items.Add(IntToStr(NP)+' Parcelas');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  data1, data2, data_apoio : String;
  i : integer;
begin
 ClientDataSet1.Open;
  data_apoio := '';
  ClientDataSet1.First;
  data1 := FormatDateTime('dd/mm/yyyy',DateTimePicker1.DateTime);
  while not(ClientDataSet1.Eof)do
  begin
    data2 := FormatDateTime('dd/mm/yyyy',ClientDataSet1vencimento.AsDateTime);
    ClientDataSet1.Next;
    if not(ClientDataSet1.Eof)then
      Edit2.Text := Edit2.Text + IntToStr(DaysBetween(StrToDate(data1),StrToDate(data2)))+ '/';
    if (ClientDataSet1.Eof)then
      Edit2.Text := Edit2.Text + IntToStr(DaysBetween(StrToDate(data1),StrToDate(data2)));
  end;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
begin
 ListBox1.Clear;
 ClientDataSet1.EmptyDataSet;
end;

end.
