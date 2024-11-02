inherited formSaldoDetalhes: TformSaldoDetalhes
  BorderStyle = bsSizeable
  Caption = 'formSaldoDetalhes'
  ClientHeight = 655
  ClientWidth = 1139
  Visible = False
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  ExplicitWidth = 1153
  ExplicitHeight = 690
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 1139
    Height = 655
    BevelKind = bkNone
    ExplicitWidth = 1139
    ExplicitHeight = 655
    object pResumo: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 353
      Height = 649
      Align = alLeft
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'pResumo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      inline frameResumo: TframeMenuSaldoDetalhado
        Left = 0
        Top = 0
        Width = 349
        Height = 645
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clFuchsia
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 349
        ExplicitHeight = 645
        inherited sbFrame: TScrollBox
          Width = 349
          Height = 645
          ExplicitWidth = 349
          ExplicitHeight = 641
          inherited pResumo: TPanel
            Width = 349
            ExplicitWidth = 349
            inherited sResumo: TShape
              Width = 349
              ExplicitWidth = 345
            end
            inherited lResumo: TLabel
              Width = 349
              Height = 29
              Font.Style = [fsBold]
              ExplicitWidth = 51
            end
          end
          inherited clResumo: TControlList
            Width = 349
            ExplicitWidth = 349
            inherited dbtValor: TDBText
              Left = 187
              ExplicitLeft = 183
            end
            inherited dbtTitulo: TDBText
              Width = 182
              ExplicitWidth = 178
            end
          end
          inherited pAdicionais: TPanel
            Width = 349
            ExplicitWidth = 349
            inherited sAdicionais: TShape
              Width = 349
              ExplicitWidth = 345
            end
            inherited lAdicionais: TLabel
              Width = 349
              Font.Style = [fsBold]
              ExplicitWidth = 65
            end
            inherited sDivAdicionais: TShape
              Width = 349
              ExplicitWidth = 345
            end
            inherited pSaldoGeralMembros: TPanel
              Width = 349
              ExplicitWidth = 349
              inherited lValorSaldoGeral: TLabel
                Left = 239
                Width = 107
                Height = 24
                ExplicitLeft = 332
              end
            end
          end
          inherited clSaldoFolha: TControlList
            Width = 349
            ExplicitWidth = 349
            inherited dbtSaldoFolhaNOME: TDBText
              Width = 182
              ExplicitWidth = 178
            end
            inherited dbtSaldoFolhaVALOR: TDBText
              Left = 187
              ExplicitLeft = 183
            end
          end
          inherited clContaPagamentos: TControlList
            Width = 349
            ExplicitWidth = 349
            inherited dbtDESCRICAO: TDBText
              Width = 113
              ExplicitWidth = 93
            end
            inherited dbtVALORcp: TDBText
              Left = 187
              ExplicitLeft = 183
            end
            inherited dbtSINAL: TDBText
              Height = 21
            end
          end
          inherited pContaPagamentos: TPanel
            Width = 349
            ExplicitWidth = 349
            inherited sContaPagamentos: TShape
              Width = 349
              ExplicitWidth = 345
            end
            inherited lContaPagamentos: TLabel
              Width = 349
              Height = 28
              Font.Style = [fsBold]
              ExplicitWidth = 168
            end
            inherited sDivContaPagamentos: TShape
              Width = 349
              ExplicitWidth = 345
            end
          end
          inherited pProjecao: TPanel
            Width = 349
            ExplicitWidth = 349
            inherited sProjecao: TShape
              Width = 349
              ExplicitWidth = 345
            end
            inherited lProjecao: TLabel
              Width = 80
              Height = 29
              Font.Style = [fsBold]
              ExplicitWidth = 57
            end
            inherited pQtdMeses: TPanel
              Left = 80
              ExplicitLeft = 80
              inherited lMeses: TLabel
                Width = 70
                Height = 23
              end
            end
          end
          inherited clProjecao: TControlList
            Width = 349
            ExplicitWidth = 349
            inherited dbtValorProjecao: TDBText
              Left = 187
              ExplicitLeft = 183
            end
            inherited dbtTituloProjecao: TDBText
              Width = 182
              ExplicitWidth = 178
            end
          end
        end
      end
    end
    object pCorpo: TPanel
      AlignWithMargins = True
      Left = 362
      Top = 3
      Width = 774
      Height = 649
      Align = alClient
      BevelKind = bkSoft
      BevelOuter = bvNone
      Caption = 'pCorpo'
      ShowCaption = False
      TabOrder = 1
      ExplicitWidth = 772
      ExplicitHeight = 645
      object pSaldoExtrato: TPanel
        Left = 0
        Top = 0
        Width = 770
        Height = 245
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        ExplicitWidth = 768
        object pnlGeral: TPanel
          Left = 0
          Top = 0
          Width = 770
          Height = 245
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 768
          object clSaldos: TControlList
            Left = 0
            Top = 60
            Width = 770
            Height = 185
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
            ExplicitWidth = 768
            object dbtData: TDBText
              AlignWithMargins = True
              Left = 5
              Top = 2
              Width = 130
              Height = 26
              Margins.Left = 5
              Margins.Top = 2
              Margins.Right = 5
              Margins.Bottom = 2
              Align = alLeft
              Alignment = taCenter
              DataField = 'datalancamento'
            end
            object dbtValor: TDBText
              AlignWithMargins = True
              Left = 405
              Top = 2
              Width = 150
              Height = 26
              Margins.Left = 5
              Margins.Top = 2
              Margins.Right = 5
              Margins.Bottom = 2
              Align = alLeft
              Alignment = taRightJustify
              DataField = 'valor'
            end
            object dbtDescricao: TDBText
              AlignWithMargins = True
              Left = 145
              Top = 2
              Width = 250
              Height = 26
              Margins.Left = 5
              Margins.Top = 2
              Margins.Right = 5
              Margins.Bottom = 2
              Align = alLeft
              DataField = 'descricao'
            end
            object iPositivo: TImage
              AlignWithMargins = True
              Left = 608
              Top = 2
              Width = 24
              Height = 26
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 2
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
              ExplicitLeft = 199
              ExplicitTop = 3
              ExplicitHeight = 30
            end
            object iNegativo: TImage
              AlignWithMargins = True
              Left = 584
              Top = 2
              Width = 24
              Height = 26
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 2
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
              ExplicitLeft = 175
              ExplicitTop = 3
              ExplicitHeight = 30
            end
            object iEquals: TImage
              AlignWithMargins = True
              Left = 560
              Top = 2
              Width = 24
              Height = 26
              Margins.Left = 0
              Margins.Top = 2
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alLeft
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
                00180806000000E0773DF800000006624B474400FF00FF00FFA0BDA793000000
                544944415478DA6364A031601CB560D402EA5810DEBC77331B1B9B14350DFEF5
                EBD7B395B5CEBE600B623B0F9FD5D3D335A2A605972E5D3EB7B8DCD6983E16D0
                3C8868094653114E309A8A8806A3168C5A4039000034644019706D5F2A000000
                0049454E44AE426082}
              ExplicitLeft = 151
              ExplicitTop = 3
              ExplicitHeight = 30
            end
            object dbtSaldo: TDBText
              AlignWithMargins = True
              Left = 637
              Top = 2
              Width = 128
              Height = 26
              Margins.Left = 5
              Margins.Top = 2
              Margins.Right = 5
              Margins.Bottom = 2
              Align = alClient
              Alignment = taRightJustify
              DataField = 'saldo'
              ExplicitLeft = 590
              ExplicitTop = -5
              ExplicitWidth = 198
              ExplicitHeight = 24
            end
          end
          object pCabecalho: TPanel
            Left = 0
            Top = 0
            Width = 770
            Height = 60
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitWidth = 768
            object lData: TLabel
              AlignWithMargins = True
              Left = 5
              Top = 30
              Width = 130
              Height = 30
              Margins.Left = 5
              Margins.Top = 0
              Margins.Right = 5
              Margins.Bottom = 0
              Align = alLeft
              Alignment = taCenter
              AutoSize = False
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object lValor: TLabel
              AlignWithMargins = True
              Left = 405
              Top = 33
              Width = 174
              Height = 24
              Margins.Left = 5
              Margins.Right = 5
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object lSaldoDisponivel: TLabel
              AlignWithMargins = True
              Left = 145
              Top = 33
              Width = 250
              Height = 24
              Margins.Left = 5
              Margins.Right = 5
              Align = alLeft
              AutoSize = False
              Caption = 'Descri'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
            end
            object lAcumulado: TLabel
              AlignWithMargins = True
              Left = 589
              Top = 30
              Width = 176
              Height = 30
              Margins.Left = 5
              Margins.Top = 0
              Margins.Right = 5
              Margins.Bottom = 0
              Align = alClient
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 600
              ExplicitTop = 0
              ExplicitWidth = 150
              ExplicitHeight = 41
            end
            object pnlSaldoInicial: TPanel
              Left = 0
              Top = 0
              Width = 770
              Height = 30
              Align = alTop
              BevelOuter = bvNone
              Caption = 'pnlSaldoInicial'
              ParentShowHint = False
              ShowCaption = False
              ShowHint = False
              TabOrder = 0
              ExplicitWidth = 768
              object lblSaldoFinal: TLabel
                AlignWithMargins = True
                Left = 99
                Top = 3
                Width = 93
                Height = 24
                Margins.Right = 15
                Align = alLeft
                Alignment = taRightJustify
                Caption = 'Saldo Final:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                ExplicitHeight = 23
              end
              object lblSaldoFinalTitulo: TLabel
                AlignWithMargins = True
                Left = 15
                Top = 3
                Width = 66
                Height = 24
                Margins.Left = 15
                Margins.Right = 15
                Align = alLeft
                Alignment = taRightJustify
                Caption = 'Saldo Final:'
                Layout = tlCenter
                ExplicitHeight = 17
              end
            end
          end
        end
      end
      object DBChart2: TDBChart
        AlignWithMargins = True
        Left = 3
        Top = 248
        Width = 764
        Height = 394
        BackWall.Transparent = False
        BackWall.Visible = False
        BackWall.Emboss.Smooth = False
        Border.SmallDots = True
        Foot.Brush.Image.Data = {
          07544269746D61707E000000424D7E000000000000003E000000280000001000
          0000100000000100010000000000400000000000000000000000020000000000
          000000000000FFFFFF00FFFF0000FFFF0000FFFF000077770000FFFF0000FFFF
          0000FFFF000077770000FFFF0000FFFF0000FFFF000077770000FFFF0000FFFF
          0000FFFF000077770000}
        Foot.ShapeStyle = fosRoundRectangle
        Gradient.Balance = 30
        Gradient.Colors = <
          item
            Color = clWhite
            Transparency = 98
          end
          item
            Color = clSilver
            Offset = 1.000000000000000000
          end>
        Gradient.Direction = gdBottomTop
        Gradient.EndColor = clSilver
        Gradient.Visible = True
        LeftWall.Pen.Visible = False
        LeftWall.Visible = False
        Title.Font.Height = -13
        Title.Font.Style = [fsBold]
        Title.Text.Strings = (
          'Saldo Detalhado')
        BottomAxis.Axis.Style = psDash
        BottomAxis.Axis.SmallDots = True
        BottomAxis.MinorTicks.Visible = False
        Hover.Visible = False
        LeftAxis.Axis.Color = 1744830464
        LeftAxis.AxisValuesFormat = '#,##0.##'
        LeftAxis.LabelsFormat.Frame.Visible = False
        LeftAxis.MinimumRound = True
        LeftAxis.MinorTicks.Visible = False
        LeftAxis.RoundFirstLabel = False
        LeftAxis.Shape.Transparent = True
        LeftAxis.Title.Pen.SmallDots = True
        LeftAxis.Title.Pen.Visible = False
        Legend.ColorWidth = 75
        Legend.CurrentPage = False
        Legend.DividingLines.SmallDots = True
        Legend.Frame.SmallDots = True
        Legend.Frame.Visible = False
        Legend.Symbol.DefaultPen = False
        Legend.Symbol.Gradient.EndColor = 16764108
        Legend.Symbol.Pen.SmallDots = True
        Legend.Symbol.Pen.Visible = False
        Legend.Symbol.Shadow.Visible = False
        Legend.Symbol.Width = 75
        Legend.Transparent = True
        Pages.ScaleLastPage = False
        View3DWalls = False
        Zoom.Pen.Fill.Gradient.Colors = <
          item
            Color = clSilver
            Transparency = 45
          end
          item
            Color = clWhite
            Offset = 0.500000000000000000
          end
          item
            Color = clGray
            Offset = 1.000000000000000000
          end>
        Zoom.Pen.Fill.Gradient.Direction = gdBottomTop
        Zoom.Pen.Fill.Gradient.EndColor = clGray
        Zoom.Pen.Fill.Gradient.MidColor = clWhite
        Zoom.Pen.Fill.Gradient.StartColor = clSilver
        Zoom.Pen.Fill.Gradient.SubGradient.Visible = True
        Zoom.Pen.Fill.Gradient.Visible = True
        Zoom.Pen.Visible = False
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        ExplicitWidth = 762
        ExplicitHeight = 390
        DefaultCanvas = 'TTeeCanvas3D'
        ColorPaletteIndex = 3
        object Series2: TBarSeries
          HoverElement = []
          BarBrush.Gradient.EndColor = 16765393
          BarPen.SmallDots = True
          BarPen.Visible = False
          ColorEachPoint = True
          Marks.Frame.Visible = False
          Marks.Style = smsValue
          Marks.Symbol.Frame.Visible = False
          Marks.Symbol.Pen.Visible = False
          DataSource = dmSaldoDetalhadoPortadorGrafico.cdsSaldoDetalhadoPortador
          ValueFormat = '#,#.00'
          XLabelsSource = 'dataalteracao'
          Gradient.EndColor = 16765393
          GradientRelative = True
          MultiBar = mbSideAll
          Sides = 128
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          YValues.ValueSource = 'saldototal'
        end
      end
    end
  end
end
