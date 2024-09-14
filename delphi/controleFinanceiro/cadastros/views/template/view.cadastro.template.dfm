inherited formCadastroTemplate: TformCadastroTemplate
  BorderStyle = bsSizeable
  Caption = ''
  ClientHeight = 573
  ClientWidth = 826
  UseDockManager = True
  Font.Color = clHighlightText
  Font.Height = -11
  Font.Name = 'Tahoma'
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 842
  ExplicitHeight = 612
  TextHeight = 13
  inherited pGeral: TPanel
    Width = 826
    Height = 573
    BevelKind = bkNone
    ExplicitWidth = 826
    ExplicitHeight = 573
    object cpCadastros: TCardPanel
      Left = 0
      Top = 45
      Width = 828
      Height = 532
      Align = alClient
      ActiveCard = cConsulta
      BevelOuter = bvNone
      Caption = 'cpCadastros'
      TabOrder = 0
      OnCardChange = cpCadastrosCardChange
      ExplicitWidth = 826
      ExplicitHeight = 528
      object cConsulta: TCard
        Left = 0
        Top = 0
        Width = 828
        Height = 532
        Margins.Top = 20
        Caption = 'cConsulta'
        CardIndex = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 826
        ExplicitHeight = 528
        object cpConsultas: TCardPanel
          Left = 0
          Top = 35
          Width = 828
          Height = 429
          Align = alClient
          ActiveCard = cConsultaGrade
          BevelOuter = bvNone
          Caption = 'cpConsultas'
          TabOrder = 0
          ExplicitWidth = 826
          ExplicitHeight = 425
          object cConsultaLista: TCard
            Left = 0
            Top = 0
            Width = 828
            Height = 429
            Margins.Top = 15
            Caption = 'cConsultaLista'
            CardIndex = 0
            TabOrder = 0
            ExplicitWidth = 832
            ExplicitHeight = 437
            object dbgConsulta: TDBGrid
              Left = 0
              Top = 33
              Width = 832
              Height = 404
              Align = alClient
              BorderStyle = bsNone
              GradientEndColor = clBtnFace
              GradientStartColor = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentColor = True
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              OnDrawColumnCell = dbgConsultaDrawColumnCell
              OnDblClick = dbgConsultaDblClick
              OnTitleClick = dbgConsultaTitleClick
            end
            object sbPesquisaConsulta: TSearchBox
              AlignWithMargins = True
              Left = 20
              Top = 3
              Width = 792
              Height = 27
              Margins.Left = 20
              Margins.Right = 20
              Align = alTop
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TextHint = 'Pesquisa...'
              OnInvokeSearch = sbPesquisaConsultaInvokeSearch
            end
          end
          object cConsultaGrade: TCard
            Left = 0
            Top = 0
            Width = 828
            Height = 429
            Caption = 'cConsultaGrade'
            CardIndex = 1
            TabOrder = 1
            ExplicitWidth = 826
            ExplicitHeight = 425
          end
        end
        object pCabecalhoConsulta: TPanel
          Left = 0
          Top = 0
          Width = 828
          Height = 35
          Margins.Top = 10
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitWidth = 826
          object sbVisualizarConsulta: TSpeedButton
            AlignWithMargins = True
            Left = 1
            Top = 2
            Width = 27
            Height = 31
            Margins.Left = 1
            Margins.Top = 2
            Margins.Right = 5
            Margins.Bottom = 2
            Action = aAbrirLista
            Align = alLeft
            ImageIndex = 2
            Images = dataImages.il24
            ExplicitLeft = 774
            ExplicitHeight = 27
          end
        end
        object pConsulta: TPanel
          Left = 0
          Top = 464
          Width = 828
          Height = 68
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitTop = 460
          ExplicitWidth = 826
          object sbExcluirCadastro: TSpeedButton
            AlignWithMargins = True
            Left = 675
            Top = 3
            Width = 150
            Height = 62
            Action = aExcluirCad
            Align = alRight
            DisabledImageIndex = 17
            ImageIndex = 14
            Images = dataImages.il40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Tahoma'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            StyleElements = [seClient]
            ExplicitLeft = 736
            ExplicitTop = 4
            ExplicitHeight = 56
          end
          object sbIncluirCadastro: TSpeedButton
            AlignWithMargins = True
            Left = 363
            Top = 3
            Width = 150
            Height = 62
            Action = aIncluirCad
            Align = alRight
            DisabledImageIndex = 18
            ImageIndex = 15
            Images = dataImages.il40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            StyleElements = [seClient]
            ExplicitLeft = 524
            ExplicitTop = 4
            ExplicitHeight = 56
          end
          object sbEditarCadastro: TSpeedButton
            AlignWithMargins = True
            Left = 519
            Top = 3
            Width = 150
            Height = 62
            Action = aEditarCad
            Align = alRight
            DisabledImageIndex = 16
            ImageIndex = 13
            Images = dataImages.il40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            StyleElements = [seClient]
            ExplicitLeft = 624
            ExplicitTop = 4
            ExplicitHeight = 56
          end
        end
      end
      object cCadastro: TCard
        AlignWithMargins = True
        Left = 3
        Top = 10
        Width = 822
        Height = 519
        Margins.Top = 10
        Caption = 'cCadastro'
        CardIndex = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 826
        ExplicitHeight = 527
        object pRodapeBotoesCad: TPanel
          Left = 0
          Top = 459
          Width = 826
          Height = 68
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object sbCancelarCadastro: TSpeedButton
            AlignWithMargins = True
            Left = 661
            Top = 3
            Width = 150
            Height = 62
            Margins.Left = 15
            Margins.Right = 15
            Action = aSair
            Align = alRight
            Caption = 'Cancelar'
            ImageIndex = 1
            Images = dataImages.il40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            StyleElements = [seClient, seBorder]
            ExplicitLeft = 709
            ExplicitHeight = 58
          end
          object sbSalvarCadastro: TSpeedButton
            AlignWithMargins = True
            Left = 481
            Top = 3
            Width = 150
            Height = 62
            Margins.Left = 15
            Margins.Right = 15
            Action = aSalvarCad
            Align = alRight
            ImageIndex = 0
            Images = dataImages.il40
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -17
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            StyleElements = [seClient, seBorder]
            ExplicitLeft = 591
            ExplicitHeight = 58
          end
        end
        object pCadastro: TPanel
          Left = 0
          Top = 0
          Width = 826
          Height = 459
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
    end
    object pCabecalhoGeral: TPanel
      Left = 0
      Top = 0
      Width = 828
      Height = 45
      Margins.Top = 20
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 826
      object lTitulo: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 50
        Height = 23
        Align = alClient
        Alignment = taCenter
        Caption = 'lTitulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        OnMouseDown = lTituloMouseDown
      end
      object sbSair: TSpeedButton
        AlignWithMargins = True
        Left = 785
        Top = 0
        Width = 40
        Height = 45
        Margins.Top = 0
        Margins.Bottom = 0
        Action = aSair
        Align = alRight
        ImageIndex = 2
        Images = dataImages.il40
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 667
        ExplicitHeight = 40
      end
    end
  end
  inherited alAcoes: TActionList
    Left = 576
    Top = 2
    inherited aSair: TAction
      Caption = ''
    end
    object aSalvarCad: TAction
      Category = 'cad.template'
      Caption = 'Salvar'
      OnExecute = aSalvarCadExecute
    end
    object aAbrirLista: TAction
      Category = 'consulta.Visualizacao'
      OnExecute = aAbrirListaExecute
    end
    object aAbrirGrade: TAction
      Category = 'consulta.Visualizacao'
      OnExecute = aAbrirGradeExecute
    end
    object aIncluirCad: TAction
      Category = 'consulta.cadastro'
      Caption = 'Incluir'
      OnExecute = aIncluirCadExecute
    end
    object aEditarCad: TAction
      Category = 'consulta.cadastro'
      Caption = 'Editar'
      OnExecute = aEditarCadExecute
    end
    object aExcluirCad: TAction
      Category = 'consulta.cadastro'
      Caption = 'Excluir'
      ShortCut = 46
      OnExecute = aExcluirCadExecute
    end
  end
end
