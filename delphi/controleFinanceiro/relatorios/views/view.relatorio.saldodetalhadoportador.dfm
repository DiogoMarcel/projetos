inherited formSaldoDetalhadoPortador: TformSaldoDetalhadoPortador
  Margins.Left = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Saldo Geral Portadores'
  ClientHeight = 670
  ClientWidth = 823
  Visible = False
  OnDestroy = FormDestroy
  ExplicitWidth = 829
  ExplicitHeight = 699
  PixelsPerInch = 96
  TextHeight = 21
  inherited pGeral: TPanel
    AlignWithMargins = True
    Top = 3
    Width = 823
    Height = 667
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ExplicitTop = 3
    ExplicitWidth = 823
    ExplicitHeight = 667
    object clSaldos: TControlList
      Left = 0
      Top = 30
      Width = 819
      Height = 633
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      ItemHeight = 30
      ItemMargins.Left = 0
      ItemMargins.Top = 0
      ItemMargins.Right = 0
      ItemMargins.Bottom = 0
      ParentColor = False
      TabOrder = 0
      OnBeforeDrawItem = clSaldosBeforeDrawItem
      ExplicitHeight = 490
      object dbtData: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 3
        Width = 150
        Height = 24
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        DataField = 'dataalteracao'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 35
      end
      object dbtSaldoTotal: TDBText
        AlignWithMargins = True
        Left = 158
        Top = 3
        Width = 150
        Height = 24
        Align = alLeft
        Alignment = taRightJustify
        DataField = 'saldototal'
        ExplicitLeft = 150
        ExplicitTop = 0
        ExplicitHeight = 35
      end
      object dbtSaldoDisponivel: TDBText
        AlignWithMargins = True
        Left = 314
        Top = 3
        Width = 150
        Height = 24
        Align = alLeft
        Alignment = taRightJustify
        DataField = 'saldodisponivel'
        ExplicitLeft = 300
        ExplicitTop = 0
        ExplicitHeight = 35
      end
      object dbtDiferenca: TDBText
        AlignWithMargins = True
        Left = 470
        Top = 3
        Width = 150
        Height = 24
        Align = alLeft
        Alignment = taRightJustify
        DataField = 'diferenca'
        ExplicitLeft = 450
        ExplicitTop = 0
        ExplicitHeight = 35
      end
      object dbtAcumulado: TDBText
        AlignWithMargins = True
        Left = 695
        Top = 3
        Width = 119
        Height = 24
        Margins.Left = 0
        Margins.Right = 5
        Align = alClient
        Alignment = taRightJustify
        DataField = 'acumulado'
        ExplicitLeft = 783
        ExplicitTop = 6
        ExplicitWidth = 86
      end
      object iPositivo: TImage
        Left = 671
        Top = 0
        Width = 24
        Height = 30
        Align = alLeft
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000001
          BA4944415478DA6364A031601CB56068592033AD4A0F443FC96ABB44750B4467
          94AAB273306D07EA60FAF193C9E34D5AFB2DAA592034A94C869397718F90D62F
          750646468677D7586FFF7DCFE8F6A2B0E301C516884F2F116366673E28A4F55B
          8389E53F58ECDF5F0686F7D7D86EFDFCC0ECF0A6B0ED39D91608F4370870F1FF
          3824A4F95397891555EEDF6FA04FAEB35E66FCC6E4F834A7FD2DC916084D6AE0
          63E7FC0974F94F0366F6FF58D5FCFDC9C8F0FE06EBE56F9F38ED3E14367C20DA
          0299BE42CE7FBC6CFB04357F9B3173FC67C2E74BA025FFDFDD603BF3EFDD1FC7
          97A53D5F095BD0D0C02629FD7DA780FA6F5B56AEFFCC84E208047EFF60FCFBE1
          1AEB71EE1FDF5CEEE44DFE89DB8255A1CC921F94360BA8FD7166E5F9C7468CE1
          30F0E72BD39FF7B7580F3C7FCAE10974E41F4C0BFE33304ACE2B5FCBAFF8C79B
          8D8F34C3E13EF9CCF4FBFD5DD65D2F9E70F8012DF987B00068B8C49C8AE5FC0A
          7FFCD805FF729263380CFCFCC0F4F3D33DD66DCF533B8281A6FF075B2031BB62
          01A7F0DF300E21CA0C87811FEF987F7E7FC7BCEA454A471CA3C4A44AD17F6CFF
          E2999919C80A165CE0EF5F865F4CBF98160EAED274D482A169010058C1A1513F
          A6AC910000000049454E44AE426082}
        Visible = False
        ExplicitLeft = 623
      end
      object iNegativo: TImage
        Left = 647
        Top = 0
        Width = 24
        Height = 30
        Align = alLeft
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000001
          C64944415478DA6364A031601CB5600458F0DCD3569481E34F3C23F37F366A1A
          FCFF2FE32F861F2C0BC13E781E68B98041F87BD87F81EF9C5431FD03C74FC677
          5CAB24D71D8F035BF01FE89317C116CBFFCB7CF463E0FF4999259FD97F323DE4
          DF26BEEE4430D0F0FFF0380059F232D462ED3FD90FDE0C3CBFC80A2EA6AF6CBF
          191E09EE12D73EEEC7D8C0F00F248612C9FF4343995FFC7FBCF9BFC27B6706AE
          DF2459C2F89DF5CFFF7B820724DF7278321E38F0072E8EAEF06AA8369BD07FDE
          9DFF95DED902239F9928D37FB0FC65B82F78FCEB172117D5EDDB7FA2588C4DFD
          E3504B4E2686FFFB9894DE9AFD67FFCB84D7F05FCCFF19EE0A9E61FA28E028B1
          6BD7570C9FE1D2F7D6D39CEF3737C3C17F2AEF0C18D8FE6257F49B8981F18EC8
          E51FBF39EC14371CF88035E8F039EE7E80830007DBF743FF95DFE932B0A259F2
          0768F86DE1CB7FFFFC7794597FEA2DCEB82114BC2F02ADC4FEB1FD3DC8A0FC56
          8381E51F44F02FC8E542B7583EB03B88EE3CFC1C9F7EA28A8A279E0E324C7CDF
          F630A8BE55070BDC15BECDF89DCB4D72C3810784F4125D16BDF23157FDCBF36F
          3B90C9C4F293D14374FDA95BC4E823A9B07BE967AE07A2C5379DBC44AC9E6150
          5C8F5A40080000C39E9B9BB166879E0000000049454E44AE426082}
        Visible = False
        ExplicitLeft = 623
        ExplicitHeight = 24
      end
      object iEquals: TImage
        Left = 623
        Top = 0
        Width = 24
        Height = 30
        Align = alLeft
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000000
          544944415478DA6364A031601CB560D402EA5810DEBC77331B1B9B14350DFEF5
          EBD7B395B5CEBE600B623B0F9FD5D3D335A2A605972E5D3EB7B8DCD6983E16D0
          3C8868094653114E309A8A8806A3168C5A4039000034644019706D5F2A000000
          0049454E44AE426082}
        Visible = False
        ExplicitLeft = 631
      end
    end
    object pCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 819
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lData: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 0
        Width = 150
        Height = 30
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 0
        ExplicitHeight = 41
      end
      object lSaldoTotal: TLabel
        AlignWithMargins = True
        Left = 158
        Top = 3
        Width = 150
        Height = 24
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 156
        ExplicitTop = 0
        ExplicitHeight = 30
      end
      object lSaldoDisponivel: TLabel
        AlignWithMargins = True
        Left = 314
        Top = 3
        Width = 150
        Height = 24
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo Dispon'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 300
        ExplicitTop = 0
        ExplicitHeight = 41
      end
      object lDiferenca: TLabel
        AlignWithMargins = True
        Left = 470
        Top = 3
        Width = 150
        Height = 24
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Diferen'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 450
        ExplicitTop = 0
        ExplicitHeight = 41
      end
      object lAcumulado: TLabel
        AlignWithMargins = True
        Left = 623
        Top = 0
        Width = 191
        Height = 30
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 600
        ExplicitWidth = 150
        ExplicitHeight = 41
      end
    end
  end
  inherited alAcoes: TActionList
    Left = 16
    Top = 64
  end
end
