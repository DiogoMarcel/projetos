object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Caixa Escola'
  ClientHeight = 917
  ClientWidth = 1102
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 23
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 1
    Top = 1
    Width = 1100
    Height = 915
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 1098
    ExplicitHeight = 911
    object GridPanel1: TGridPanel
      Left = 0
      Top = 874
      Width = 1100
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'GridPanel1'
      ColumnCollection = <
        item
          Value = 33.333333333333300000
        end
        item
          Value = 33.333333333333300000
        end
        item
          Value = 33.333333333333400000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = SpeedButton1
          Row = 0
        end
        item
          Column = 1
          Control = SpeedButton2
          Row = 0
        end
        item
          Column = 2
          Control = SpeedButton3
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAuto
        end>
      ShowCaption = False
      TabOrder = 0
      ExplicitTop = 870
      ExplicitWidth = 1098
      DesignSize = (
        1100
        41)
      object SpeedButton1: TSpeedButton
        Left = 93
        Top = 0
        Width = 180
        Height = 40
        Action = aFichas
        Anchors = []
        ImageIndex = 2
        ImageName = 'ticket'
        Images = datas.Imagens
        Flat = True
        ExplicitLeft = 74
        ExplicitTop = 3
      end
      object SpeedButton2: TSpeedButton
        Left = 460
        Top = 0
        Width = 180
        Height = 40
        Action = aRetiradas
        Anchors = []
        ImageIndex = 4
        ImageName = 'cashback'
        Images = datas.Imagens
        Flat = True
        ExplicitLeft = 404
        ExplicitTop = 3
      end
      object SpeedButton3: TSpeedButton
        Left = 826
        Top = 0
        Width = 180
        Height = 40
        Action = aCaixas
        Anchors = []
        ImageIndex = 3
        ImageName = 'caixa'
        Images = datas.Imagens30
        Flat = True
        ExplicitLeft = 733
        ExplicitTop = 3
      end
    end
    object Panel16: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 874
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'Panel16'
      ShowCaption = False
      TabOrder = 1
      ExplicitHeight = 870
      object cbMenu: TCategoryButtons
        Left = 0
        Top = 0
        Width = 185
        Height = 561
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ButtonFlow = cbfVertical
        ButtonHeight = 40
        ButtonOptions = [boFullSize, boGradientFill, boShowCaptions]
        Categories = <>
        Images = datas.Imagens10
        RegularButtonColor = clWhite
        SelectedButtonColor = 15132390
        TabOrder = 0
        ExplicitHeight = 557
      end
      object Panel3: TPanel
        Left = 0
        Top = 561
        Width = 185
        Height = 313
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 1
        ExplicitTop = 557
        object lData: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 276
          Width = 179
          Height = 14
          Align = alBottom
          Alignment = taCenter
          Caption = 'lData'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 27
        end
        object lHora: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 296
          Width = 179
          Height = 14
          Align = alBottom
          Alignment = taCenter
          Caption = 'lHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 27
        end
      end
    end
    object ScrollBox1: TScrollBox
      Left = 185
      Top = 0
      Width = 915
      Height = 874
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 2
      ExplicitWidth = 913
      ExplicitHeight = 870
      object Panel2: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 909
        Height = 868
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ShowCaption = False
        TabOrder = 0
        ExplicitWidth = 907
        ExplicitHeight = 864
        object panCabecalho: TPanel
          Left = 0
          Top = 0
          Width = 909
          Height = 38
          Margins.Left = 1
          Margins.Right = 1
          Margins.Bottom = 1
          Align = alTop
          BevelKind = bkSoft
          BevelOuter = bvNone
          Caption = 'panCabecalho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ShowCaption = False
          TabOrder = 0
          ExplicitWidth = 907
          object titCaixa: TDBText
            AlignWithMargins = True
            Left = 65
            Top = 0
            Width = 237
            Height = 34
            Margins.Left = 20
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alLeft
            DataField = 'nomeCaixa'
            DataSource = datas.sourceMovimento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -24
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ExplicitLeft = 306
            ExplicitTop = 2
          end
          object SpeedButton5: TSpeedButton
            AlignWithMargins = True
            Left = 3
            Top = 1
            Width = 32
            Height = 32
            Margins.Top = 1
            Margins.Right = 10
            Margins.Bottom = 1
            Action = aImprimir
            Align = alLeft
            ImageIndex = 11
            ImageName = 'print'
            Images = datas.Imagens30
            Flat = True
            ExplicitTop = 3
          end
          object panTroco: TPanel
            Left = 408
            Top = 0
            Width = 497
            Height = 34
            Align = alRight
            BevelOuter = bvNone
            Caption = 'panTroco'
            ShowCaption = False
            TabOrder = 0
            ExplicitLeft = 406
            object Label2: TLabel
              AlignWithMargins = True
              Left = 86
              Top = 3
              Width = 174
              Height = 28
              Align = alRight
              Caption = 'Saldo Inicial / Troco:'
              Layout = tlCenter
              ExplicitLeft = 78
              ExplicitHeight = 23
            end
            object SpeedButton4: TSpeedButton
              AlignWithMargins = True
              Left = 464
              Top = 1
              Width = 32
              Height = 32
              Margins.Left = 1
              Margins.Top = 1
              Margins.Right = 1
              Margins.Bottom = 1
              Action = aEditMovto
              Align = alRight
              ImageIndex = 10
              ImageName = 'ok'
              Images = datas.Imagens30
              Flat = True
              ExplicitLeft = 881
            end
            object editTroco: TDBEdit
              AlignWithMargins = True
              Left = 266
              Top = 3
              Width = 194
              Height = 28
              Align = alRight
              BorderStyle = bsNone
              DataField = 'troco'
              DataSource = datas.sourceMovimento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 39
          Width = 909
          Height = 195
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelKind = bkTile
          BevelOuter = bvNone
          Caption = 'Panel4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ShowCaption = False
          TabOrder = 1
          ExplicitWidth = 907
          object Label3: TLabel
            AlignWithMargins = True
            Left = 25
            Top = 0
            Width = 880
            Height = 19
            Margins.Left = 25
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Fichas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 50
          end
          object pFichas: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 22
            Width = 241
            Height = 166
            Align = alLeft
            BevelKind = bkFlat
            BevelOuter = bvNone
            Caption = 'pFichas'
            ShowCaption = False
            TabOrder = 0
            object Label4: TLabel
              Left = 30
              Top = 5
              Width = 178
              Height = 16
              Caption = 'Informe a quantidade de fichas'
            end
            object Label5: TLabel
              Left = 30
              Top = 60
              Width = 177
              Height = 16
              Caption = 'Informe qual ficha foi entregue'
            end
            object editQtdFicha: TEdit
              Left = 30
              Top = 27
              Width = 178
              Height = 24
              TabOrder = 0
              TextHint = 'Fichas entregues'
            end
            object Button4: TButton
              Left = 30
              Top = 120
              Width = 178
              Height = 35
              Action = aIncluiFichas
              ImageIndex = 2
              ImageName = 'ticket'
              Images = datas.Imagens
              TabOrder = 2
            end
            object lookFichas: TDBLookupComboBox
              Left = 30
              Top = 82
              Width = 178
              Height = 24
              KeyField = 'id'
              ListField = 'nome'
              ListSource = datas.sourceFichas
              TabOrder = 1
            end
          end
          object Panel6: TPanel
            Left = 247
            Top = 19
            Width = 507
            Height = 172
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel6'
            TabOrder = 1
            ExplicitWidth = 505
            object gridMovFicha: TDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 501
              Height = 148
              Margins.Bottom = 0
              Align = alClient
              DataSource = datas.sourceMovFichas
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Caption = 'C'#243'digo'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'id_fichas'
                  Title.Alignment = taCenter
                  Title.Caption = 'F'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'quantidade'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Quantidade'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valorFicha'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Valor da Ficha'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'parcial'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Valor Parcial'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'id_movto'
                  Title.Alignment = taCenter
                  Title.Caption = 'Caixa'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'nomeCaixa'
                  Title.Caption = 'Caixa'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'log'
                  Title.Caption = 'Registro'
                  Visible = True
                end>
            end
            object navFichas: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 151
              Width = 501
              Height = 18
              Margins.Top = 0
              DataSource = datas.sourceMovFichas
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
              Align = alBottom
              TabOrder = 1
              ExplicitWidth = 499
            end
          end
          object Panel7: TPanel
            Left = 754
            Top = 19
            Width = 151
            Height = 172
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel7'
            ShowCaption = False
            TabOrder = 2
            ExplicitLeft = 752
            object lValorFichas: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 108
              Width = 145
              Height = 19
              Align = alTop
              Alignment = taCenter
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 15
            end
            object Label7: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 145
              Height = 24
              Align = alTop
              Alignment = taCenter
              Caption = 'Resumo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 71
            end
            object Label8: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 83
              Width = 145
              Height = 19
              Align = alTop
              Alignment = taCenter
              Caption = 'Valor fichas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 82
            end
            object Label9: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 33
              Width = 145
              Height = 19
              Align = alTop
              Alignment = taCenter
              Caption = 'Quantidade fichas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 126
            end
            object lQtdFichas: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 58
              Width = 145
              Height = 19
              Align = alTop
              Alignment = taCenter
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 15
            end
          end
        end
        object Panel8: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 431
          Width = 909
          Height = 273
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alTop
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Panel8'
          ShowCaption = False
          TabOrder = 3
          ExplicitWidth = 907
          object Label6: TLabel
            AlignWithMargins = True
            Left = 25
            Top = 0
            Width = 880
            Height = 19
            Margins.Left = 25
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Alignment = taCenter
            Caption = 'Fechamento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            ExplicitWidth = 99
          end
          object GridPanel2: TGridPanel
            Left = 0
            Top = 19
            Width = 905
            Height = 220
            Align = alClient
            BevelOuter = bvNone
            Caption = 'GridPanel2'
            ColumnCollection = <
              item
                Value = 50.000000000000000000
              end
              item
                Value = 50.000000000000000000
              end>
            ControlCollection = <
              item
                Column = 0
                Control = Panel9
                Row = 0
              end
              item
                Column = 1
                Control = Panel10
                Row = 0
              end
              item
                Column = 0
                Control = Panel20
                Row = 1
              end
              item
                Column = 1
                Control = Panel21
                Row = 1
              end>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            RowCollection = <
              item
                Value = 100.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 30.000000000000000000
              end>
            ShowCaption = False
            TabOrder = 0
            ExplicitWidth = 903
            object Panel9: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 446
              Height = 184
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel9'
              ShowCaption = False
              TabOrder = 0
              object Label1: TLabel
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 446
                Height = 19
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Alignment = taCenter
                Caption = 'Fichas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitWidth = 50
              end
              object pFecFichas: TPanel
                AlignWithMargins = True
                Left = 1
                Top = 20
                Width = 197
                Height = 163
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Align = alLeft
                BevelKind = bkFlat
                BevelOuter = bvNone
                Caption = 'Panel5'
                ShowCaption = False
                TabOrder = 0
                object Label16: TLabel
                  Left = 8
                  Top = 7
                  Width = 178
                  Height = 16
                  Caption = 'Informe a quantidade de fichas'
                end
                object Label17: TLabel
                  Left = 8
                  Top = 59
                  Width = 177
                  Height = 16
                  Caption = 'Informe qual ficha foi entregue'
                end
                object editFecFicha: TEdit
                  Left = 8
                  Top = 29
                  Width = 178
                  Height = 24
                  TabOrder = 0
                  TextHint = 'Fichas entregues'
                end
                object Button2: TButton
                  Left = 8
                  Top = 111
                  Width = 178
                  Height = 35
                  Action = aIncFichaFec
                  ImageIndex = 2
                  ImageName = 'ticket'
                  Images = datas.Imagens
                  TabOrder = 2
                end
                object lookFecFicha: TDBLookupComboBox
                  Left = 8
                  Top = 81
                  Width = 178
                  Height = 24
                  KeyField = 'id'
                  ListField = 'nome'
                  ListSource = datas.sourceFichas
                  TabOrder = 1
                end
              end
              object Panel18: TPanel
                AlignWithMargins = True
                Left = 200
                Top = 20
                Width = 245
                Height = 163
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel18'
                ShowCaption = False
                TabOrder = 1
                object gridFecFicha: TDBGrid
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 239
                  Height = 139
                  Margins.Bottom = 0
                  Align = alClient
                  DataSource = datas.sourceFecFicha
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'id'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'id_fichas'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'quantidade'
                      Title.Caption = 'Quantidade'
                      Width = 120
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'valorFicha'
                      Title.Caption = 'Valor da Ficha'
                      Width = 120
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'parcial'
                      Title.Caption = 'Valor Parcial'
                      Width = 120
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'id_movto'
                      Title.Alignment = taCenter
                      Title.Caption = 'Caixa'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'nomeCaixa'
                      Title.Caption = 'Caixa'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'log'
                      Title.Caption = 'Registro'
                      Visible = True
                    end>
                end
                object navFecFichas: TDBNavigator
                  AlignWithMargins = True
                  Left = 3
                  Top = 142
                  Width = 239
                  Height = 18
                  Margins.Top = 0
                  DataSource = datas.sourceFecFicha
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
                  Align = alBottom
                  TabOrder = 1
                end
              end
            end
            object Panel10: TPanel
              AlignWithMargins = True
              Left = 455
              Top = 3
              Width = 447
              Height = 184
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel10'
              ShowCaption = False
              TabOrder = 1
              object Label15: TLabel
                AlignWithMargins = True
                Left = 0
                Top = 0
                Width = 447
                Height = 19
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Alignment = taCenter
                Caption = 'Saldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitWidth = 45
              end
              object pFecSaldo: TPanel
                AlignWithMargins = True
                Left = 1
                Top = 20
                Width = 197
                Height = 163
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Align = alLeft
                BevelKind = bkFlat
                BevelOuter = bvNone
                Caption = 'Panel8'
                ShowCaption = False
                TabOrder = 0
                object Label20: TLabel
                  Left = 8
                  Top = 7
                  Width = 88
                  Height = 16
                  Caption = 'Informe o valor'
                end
                object Label21: TLabel
                  Left = 8
                  Top = 59
                  Width = 165
                  Height = 16
                  Caption = 'Informe o tipo de valor saldo'
                end
                object Button3: TButton
                  Left = 8
                  Top = 111
                  Width = 178
                  Height = 35
                  Action = aIncRetiradaFec
                  ImageIndex = 7
                  ImageName = 'cash'
                  Images = datas.Imagens30
                  TabOrder = 2
                end
                object lookFecTipo: TDBLookupComboBox
                  Left = 8
                  Top = 81
                  Width = 178
                  Height = 24
                  KeyField = 'id'
                  ListField = 'nome'
                  ListSource = datas.sourceRetiradas
                  TabOrder = 1
                end
                object editFecValor: TEditMaskMDS
                  Left = 8
                  Top = 29
                  Width = 178
                  Height = 24
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  Text = ''
                  TextHint = 'Valor saldo'
                end
              end
              object Panel22: TPanel
                AlignWithMargins = True
                Left = 200
                Top = 20
                Width = 246
                Height = 163
                Margins.Left = 1
                Margins.Top = 1
                Margins.Right = 1
                Margins.Bottom = 1
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Panel18'
                ShowCaption = False
                TabOrder = 1
                object gridFecSaldo: TDBGrid
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 240
                  Height = 139
                  Margins.Bottom = 0
                  Align = alClient
                  DataSource = datas.sourceFecSaldo
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'id'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'id_retirada'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'tipo'
                      Title.Caption = 'Tipo informado'
                      Width = 140
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'valor'
                      Title.Caption = 'Valor do saldo'
                      Width = 120
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'id_movto'
                      Title.Alignment = taCenter
                      Title.Caption = 'Caixa'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'nomeCaixa'
                      Title.Caption = 'Caixa'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'log'
                      Title.Caption = 'Registro'
                      Visible = True
                    end>
                end
                object navFecSaldo: TDBNavigator
                  AlignWithMargins = True
                  Left = 3
                  Top = 142
                  Width = 240
                  Height = 18
                  Margins.Top = 0
                  DataSource = datas.sourceFecSaldo
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
                  Align = alBottom
                  TabOrder = 1
                end
              end
            end
            object Panel20: TPanel
              Left = 0
              Top = 190
              Width = 452
              Height = 30
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel20'
              ShowCaption = False
              TabOrder = 2
              object Label18: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 120
                Height = 24
                Align = alLeft
                Caption = 'Total em fichas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
                ExplicitHeight = 21
              end
              object lTotalFichas: TLabel
                AlignWithMargins = True
                Left = 129
                Top = 3
                Width = 320
                Height = 24
                Align = alClient
                Alignment = taCenter
                Caption = 'lTotalFichas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                ExplicitWidth = 102
                ExplicitHeight = 21
              end
            end
            object Panel21: TPanel
              Left = 452
              Top = 190
              Width = 453
              Height = 30
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel20'
              ShowCaption = False
              TabOrder = 3
              object Label19: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 117
                Height = 24
                Align = alLeft
                Caption = 'Total em Saldo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
                ExplicitHeight = 21
              end
              object lTotalSaldo: TLabel
                AlignWithMargins = True
                Left = 126
                Top = 3
                Width = 324
                Height = 24
                Align = alClient
                Alignment = taCenter
                Caption = 'lTotalSaldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                ExplicitWidth = 96
                ExplicitHeight = 21
              end
            end
          end
          object Panel23: TPanel
            Left = 0
            Top = 239
            Width = 905
            Height = 30
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'Panel23'
            ShowCaption = False
            TabOrder = 1
            ExplicitWidth = 903
            object lTotalFechamento: TLabel
              AlignWithMargins = True
              Left = 688
              Top = 0
              Width = 167
              Height = 30
              Margins.Top = 0
              Margins.Right = 50
              Margins.Bottom = 0
              Align = alRight
              Alignment = taRightJustify
              Caption = 'Total fechamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitHeight = 23
            end
            object Label23: TLabel
              AlignWithMargins = True
              Left = 50
              Top = 0
              Width = 146
              Height = 30
              Margins.Left = 50
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Caption = 'Total fechamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -19
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              ExplicitHeight = 23
            end
          end
        end
        object Panel12: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 235
          Width = 909
          Height = 195
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'Panel8'
          ShowCaption = False
          TabOrder = 2
          ExplicitWidth = 907
          object Label10: TLabel
            AlignWithMargins = True
            Left = 25
            Top = 0
            Width = 880
            Height = 19
            Margins.Left = 25
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Caption = 'Retiradas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 79
          end
          object pRetiradas: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 22
            Width = 242
            Height = 166
            Align = alLeft
            BevelKind = bkFlat
            BevelOuter = bvNone
            Caption = 'Panel8'
            ShowCaption = False
            TabOrder = 0
            object Label11: TLabel
              Left = 30
              Top = 5
              Width = 137
              Height = 16
              Caption = 'Informe o valor retirado'
            end
            object Label12: TLabel
              Left = 30
              Top = 60
              Width = 148
              Height = 16
              Caption = 'Informe o tipo de retirada'
            end
            object Button1: TButton
              Left = 30
              Top = 120
              Width = 178
              Height = 35
              Action = aIncluirRetirada
              ImageIndex = 4
              ImageName = 'cashback'
              Images = datas.Imagens
              TabOrder = 2
            end
            object lookRetiradas: TDBLookupComboBox
              Left = 30
              Top = 82
              Width = 178
              Height = 24
              KeyField = 'id'
              ListField = 'nome'
              ListSource = datas.sourceRetiradas
              TabOrder = 1
            end
            object editValorRetirado: TEditMaskMDS
              Left = 30
              Top = 27
              Width = 178
              Height = 24
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = ''
              TextHint = 'Valor Retirado'
            end
          end
          object Panel14: TPanel
            Left = 248
            Top = 19
            Width = 508
            Height = 172
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel8'
            ShowCaption = False
            TabOrder = 1
            ExplicitWidth = 506
            object navRetiradas: TDBNavigator
              AlignWithMargins = True
              Left = 3
              Top = 151
              Width = 502
              Height = 18
              Margins.Top = 0
              DataSource = datas.sourceMovRetirada
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
              Align = alBottom
              TabOrder = 0
              ExplicitWidth = 500
            end
            object gridMovRetirada: TDBGrid
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 502
              Height = 148
              Margins.Bottom = 0
              Align = alClient
              DataSource = datas.sourceMovRetirada
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -13
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'id'
                  Title.Caption = 'C'#243'digo'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'id_retirada'
                  Title.Caption = 'R'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'tipo'
                  Title.Caption = 'Tipo da Retirada'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'valor'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'Valor da Retirada'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'id_movto'
                  Title.Alignment = taCenter
                  Title.Caption = 'Caixa'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'nomeCaixa'
                  Title.Caption = 'Caixa'
                  Visible = False
                end
                item
                  Expanded = False
                  FieldName = 'log'
                  Title.Caption = 'Registro'
                  Visible = True
                end>
            end
          end
          object Panel15: TPanel
            Left = 756
            Top = 19
            Width = 149
            Height = 172
            Align = alRight
            BevelOuter = bvNone
            Caption = 'Panel8'
            ShowCaption = False
            TabOrder = 2
            ExplicitLeft = 754
            object Label13: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 143
              Height = 24
              Align = alTop
              Alignment = taCenter
              Caption = 'Resumo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 71
            end
            object Label14: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 33
              Width = 143
              Height = 19
              Align = alTop
              Alignment = taCenter
              Caption = 'Valor retirado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 97
            end
            object lValorRetirado: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 58
              Width = 143
              Height = 19
              Align = alTop
              Alignment = taCenter
              Caption = '...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 15
            end
          end
        end
        object Panel17: TPanel
          AlignWithMargins = True
          Left = 0
          Top = 710
          Width = 909
          Height = 150
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel17'
          ShowCaption = False
          TabOrder = 4
          ExplicitWidth = 907
          object GridPanel3: TGridPanel
            Left = 0
            Top = 0
            Width = 909
            Height = 150
            Align = alClient
            BevelOuter = bvNone
            Caption = 'GridPanel3'
            ColumnCollection = <
              item
                Value = 50.000000000000000000
              end
              item
                Value = 50.000000000000000000
              end>
            ControlCollection = <
              item
                Column = 0
                Control = Panel24
                Row = 0
              end
              item
                Column = 1
                Control = Panel25
                Row = 0
              end>
            RowCollection = <
              item
                Value = 100.000000000000000000
              end>
            ShowCaption = False
            TabOrder = 0
            ExplicitWidth = 907
            object Panel24: TPanel
              Left = 0
              Top = 0
              Width = 454
              Height = 150
              Align = alClient
              BevelKind = bkSoft
              BevelOuter = bvNone
              Caption = 'Panel24'
              ShowCaption = False
              TabOrder = 0
              object Label22: TLabel
                AlignWithMargins = True
                Left = 25
                Top = 0
                Width = 425
                Height = 19
                Margins.Left = 25
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Resumo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitWidth = 65
              end
              object Label25: TLabel
                Left = 105
                Top = 31
                Width = 65
                Height = 19
                Alignment = taRightJustify
                Caption = 'Retirado:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label26: TLabel
                Left = 79
                Top = 56
                Width = 91
                Height = 19
                Alignment = taRightJustify
                Caption = 'Fechamento:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lResumoRetirado: TLabel
                Left = 182
                Top = 31
                Width = 120
                Height = 19
                Caption = 'lResumoRetirado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lResumoFechamento: TLabel
                Left = 182
                Top = 56
                Width = 146
                Height = 19
                Caption = 'lResumoFechamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label29: TLabel
                Left = 366
                Top = 56
                Width = 52
                Height = 19
                Alignment = taRightJustify
                Caption = 'Parcial:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lResumoParcial: TLabel
                Left = 430
                Top = 56
                Width = 107
                Height = 19
                Caption = 'lResumoParcial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label31: TLabel
                Left = 23
                Top = 81
                Width = 147
                Height = 19
                Alignment = taRightJustify
                Caption = 'Saldo inicial / Troco:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lResumoLancamento: TLabel
                Left = 182
                Top = 81
                Width = 146
                Height = 19
                Caption = 'lResumoLancamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label33: TLabel
                Left = 125
                Top = 106
                Width = 45
                Height = 19
                Alignment = taRightJustify
                Caption = 'Saldo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lResumoSaldo: TLabel
                Left = 182
                Top = 106
                Width = 100
                Height = 19
                Caption = 'lResumoSaldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lTipoSaldo: TLabel
                Left = 366
                Top = 106
                Width = 75
                Height = 19
                Caption = 'lTipoSaldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object bSinal: TSpeedButton
                Left = 337
                Top = 103
                Width = 23
                Height = 22
                ImageIndex = 5
                ImageName = 'dot'
                Images = datas.Imagens20
                Flat = True
              end
            end
            object Panel25: TPanel
              Left = 454
              Top = 0
              Width = 455
              Height = 150
              Align = alClient
              BevelKind = bkSoft
              BevelOuter = bvNone
              Caption = 'Panel25'
              ShowCaption = False
              TabOrder = 1
              object Label24: TLabel
                AlignWithMargins = True
                Left = 25
                Top = 0
                Width = 426
                Height = 19
                Margins.Left = 25
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alTop
                Caption = 'Detalhes'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitWidth = 72
              end
              object Label36: TLabel
                Left = 44
                Top = 31
                Width = 132
                Height = 19
                Hint = 'Retiradas + Fechamento saldos'
                Alignment = taRightJustify
                Caption = 'Retiradas + Saldo:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object Label37: TLabel
                Left = 52
                Top = 56
                Width = 124
                Height = 19
                Hint = 'Fichas recebidas '#8211' devolvidas'
                Alignment = taRightJustify
                Caption = 'Vendas de fichas:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object Label38: TLabel
                Left = 35
                Top = 81
                Width = 141
                Height = 19
                Hint = 'Valor sem Inicial/Troco '#8211' Total geral do caixa'
                Alignment = taRightJustify
                Caption = 'Valor final do caixa:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
              end
              object Label39: TLabel
                Left = 104
                Top = 106
                Width = 72
                Height = 19
                Alignment = taRightJustify
                Caption = 'Diferen'#231'a:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lDetFechamento: TLabel
                Left = 208
                Top = 31
                Width = 113
                Height = 19
                Caption = 'lDetFechamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lDetVendas: TLabel
                Left = 208
                Top = 56
                Width = 79
                Height = 19
                Caption = 'lDetVendas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lDetCaixa: TLabel
                Left = 208
                Top = 80
                Width = 81
                Height = 21
                Caption = 'lDetCaixa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -17
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lDetDiferenca: TLabel
                Left = 208
                Top = 106
                Width = 94
                Height = 19
                Caption = 'lDetDiferenca'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -16
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
            end
          end
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 25
    Top = 25
    object aFichas: TAction
      Caption = 'Fichas'
      OnExecute = aFichasExecute
    end
    object aCaixas: TAction
      Caption = 'Caixas'
      OnExecute = aCaixasExecute
    end
    object aRetiradas: TAction
      Caption = 'Retiradas'
      OnExecute = aRetiradasExecute
    end
    object aMenu: TAction
      OnExecute = aMenuExecute
    end
    object aIncluiFichas: TAction
      Caption = 'Incluir Fichas'
      OnExecute = aIncluiFichasExecute
    end
    object aIncluirRetirada: TAction
      Caption = 'Incluir Retirada'
      OnExecute = aIncluirRetiradaExecute
    end
    object aIncFichaFec: TAction
      Caption = 'Incluir Fichas'
      OnExecute = aIncFichaFecExecute
    end
    object aIncRetiradaFec: TAction
      Caption = 'Incluir Saldo'
      OnExecute = aIncRetiradaFecExecute
    end
    object aFechamentoGeral: TAction
      Caption = 'Detalhes'
      OnExecute = aFechamentoGeralExecute
    end
    object aEditMovto: TAction
      OnExecute = aEditMovtoExecute
    end
    object aImprimir: TAction
      OnExecute = aImprimirExecute
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 121
    Top = 25
  end
end
