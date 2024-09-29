inherited formSaldoDetalhadoPortadorGrafico: TformSaldoDetalhadoPortadorGrafico
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Saldo Gr'#225'fico'
  ClientHeight = 665
  ClientWidth = 1328
  Visible = False
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  ExplicitWidth = 1342
  ExplicitHeight = 700
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 1328
    Height = 665
    ExplicitWidth = 1326
    ExplicitHeight = 249
    object DBChart2: TDBChart
      Left = 0
      Top = 0
      Width = 1324
      Height = 661
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
      TabOrder = 0
      ExplicitLeft = 96
      ExplicitTop = 193
      ExplicitWidth = 1328
      ExplicitHeight = 416
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
  inherited alAcoes: TActionList
    Left = 56
    Top = 24
  end
end
