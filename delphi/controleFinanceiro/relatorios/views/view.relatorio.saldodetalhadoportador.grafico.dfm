inherited formSaldoDetalhadoPortadorGrafico: TformSaldoDetalhadoPortadorGrafico
  Caption = 'formSaldoDetalhadoPortadorGrafico'
  ClientHeight = 1080
  ClientWidth = 1920
  Visible = False
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  ExplicitWidth = 1920
  ExplicitHeight = 1080
  PixelsPerInch = 96
  TextHeight = 21
  inherited pGeral: TPanel
    Width = 1920
    Height = 1080
    ExplicitWidth = 1920
    ExplicitHeight = 1080
    object DBChart1: TDBChart
      Left = 0
      Top = 0
      Width = 1916
      Height = 1076
      BackImage.Inside = True
      Title.Text.Strings = (
        'Saldo Detalhado')
      Align = alClient
      ParentColor = True
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        13
        15
        13)
      ColorPaletteIndex = 13
      object Series1: TBarSeries
        BarBrush.Style = bsHorizontal
        BarBrush.Gradient.EndColor = 7028779
        BarBrush.Gradient.Visible = True
        BarPen.Color = clDefault
        BarPen.Visible = False
        ColorEachPoint = True
        Marks.Frame.Visible = False
        Marks.Transparent = True
        Marks.Style = smsValue
        Marks.Arrow.Visible = False
        Marks.Callout.Draw3D = True
        Marks.Callout.Arrow.Visible = False
        DataSource = dmSaldoDetalhadoPortadorGrafico.cdsSaldoDetalhadoPortador
        Title = 'Saldo Detalhado'
        XLabelsSource = 'dataalteracao'
        BarStyle = bsRectGradient
        Gradient.EndColor = 7028779
        Gradient.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
        YValues.ValueSource = 'saldototal'
      end
    end
  end
  inherited alAcoes: TActionList
    Left = 40
  end
  object DBCrossTabSource1: TDBCrossTabSource
  end
end
