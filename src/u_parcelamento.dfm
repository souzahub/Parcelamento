object Form1: TForm1
  Left = 435
  Top = 232
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'MainForm'
  ClientHeight = 313
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 168
    Width = 101
    Height = 13
    Caption = 'Forma de Pagamento'
  end
  object Label2: TLabel
    Left = 8
    Top = 243
    Width = 100
    Height = 13
    Caption = 'Data de Faturamento'
  end
  object Label3: TLabel
    Left = 120
    Top = 168
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object Button1: TButton
    Left = 8
    Top = 209
    Width = 217
    Height = 25
    Caption = 'Converte Forma de Pagamento em Datas'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 217
    Height = 153
    Ctl3D = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 1
    OnDblClick = ListBox1DblClick
  end
  object DBGrid1: TDBGrid
    Left = 232
    Top = 8
    Width = 409
    Height = 273
    Ctl3D = True
    DataSource = DataSource1
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'parcela'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vencimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_parcela'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'n_parcela'
        Visible = True
      end>
  end
  object Button2: TButton
    Left = 8
    Top = 288
    Width = 217
    Height = 21
    Caption = 'Converte Datas em Forma de Pagamento ->'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 184
    Width = 105
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 4
    Text = '30/60/90'
  end
  object Edit2: TEdit
    Left = 232
    Top = 288
    Width = 409
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 5
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 260
    Width = 217
    Height = 21
    Date = 40495.000000000000000000
    Time = 0.372157476849679400
    TabOrder = 6
  end
  object Edit3: TEdit
    Left = 120
    Top = 184
    Width = 105
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 7
    Text = '513,00'
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 112
    Top = 64
  end
  object ClientDataSet1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 40
    Top = 21
    object ClientDataSet1parcela: TIntegerField
      FieldName = 'parcela'
    end
    object ClientDataSet1vencimento: TDateTimeField
      FieldName = 'vencimento'
    end
    object ClientDataSet1valor_parcela: TCurrencyField
      FieldName = 'valor_parcela'
    end
    object ClientDataSet1n_parcela: TStringField
      FieldName = 'n_parcela'
      Size = 10
    end
  end
end
