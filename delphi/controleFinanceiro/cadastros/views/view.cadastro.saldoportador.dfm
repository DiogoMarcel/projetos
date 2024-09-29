inherited formCadSaldoPortador: TformCadSaldoPortador
  ClientHeight = 573
  ClientWidth = 826
  TextHeight = 13
  inherited pGeral: TPanel
    Width = 826
    Height = 573
    ExplicitWidth = 824
    ExplicitHeight = 569
    inherited cpCadastros: TCardPanel
      Width = 826
      Height = 528
      ExplicitWidth = 824
      ExplicitHeight = 524
      inherited cConsulta: TCard
        Width = 826
        Height = 528
        ExplicitWidth = 824
        ExplicitHeight = 524
        inherited cpConsultas: TCardPanel
          Width = 826
          Height = 425
          ExplicitWidth = 824
          ExplicitHeight = 421
          inherited cConsultaLista: TCard
            Width = 826
            Height = 425
            ExplicitWidth = 826
            ExplicitHeight = 425
          end
          inherited cConsultaGrade: TCard
            Width = 826
            Height = 425
            ExplicitWidth = 824
            ExplicitHeight = 421
            object sbConsultaGrade: TScrollBox
              Left = 0
              Top = 0
              Width = 826
              Height = 425
              HorzScrollBar.Visible = False
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              ExplicitWidth = 824
              ExplicitHeight = 421
            end
          end
        end
        inherited pCabecalhoConsulta: TPanel
          Width = 826
          ExplicitWidth = 824
          inherited sbVisualizarConsulta: TSpeedButton
            ExplicitLeft = 3
            ExplicitHeight = 31
          end
          object sbTransferenciaPortador: TSpeedButton
            AlignWithMargins = True
            Left = 34
            Top = 2
            Width = 263
            Height = 31
            Margins.Left = 1
            Margins.Top = 2
            Margins.Right = 5
            Margins.Bottom = 2
            Action = aTransferenciaPortador
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            StyleElements = [seClient, seBorder]
          end
        end
        inherited pConsulta: TPanel
          Top = 460
          Width = 826
          ExplicitTop = 456
          ExplicitWidth = 824
          inherited sbExcluirCadastro: TSpeedButton
            Left = 673
            ExplicitLeft = 673
          end
          inherited sbIncluirCadastro: TSpeedButton
            Left = 361
            ExplicitLeft = 361
          end
          inherited sbEditarCadastro: TSpeedButton
            Left = 517
            ExplicitLeft = 517
          end
        end
      end
      inherited cCadastro: TCard
        Width = 820
        Height = 515
        ExplicitWidth = 820
        ExplicitHeight = 515
        inherited pRodapeBotoesCad: TPanel
          Top = 447
          Width = 820
          ExplicitTop = 447
          ExplicitWidth = 820
        end
        inherited pCadastro: TPanel
          Width = 820
          Height = 447
          ExplicitWidth = 820
          ExplicitHeight = 447
          object tIdSaldoPortador: TDBText
            Left = 195
            Top = 32
            Width = 124
            Height = 21
            AutoSize = True
            DataField = 'IdSaldoPortador'
            DataSource = dataCadastroSaldoPortador.dsCadastro
          end
          object lIdSaldoPortador: TLabel
            Left = 94
            Top = 32
            Width = 95
            Height = 21
            Alignment = taRightJustify
            Caption = 'Identifica'#231#227'o'
          end
          object lValor: TLabel
            Left = 151
            Top = 67
            Width = 38
            Height = 21
            Alignment = taRightJustify
            Caption = 'Valor'
          end
          object lId_Portador: TLabel
            Left = 126
            Top = 244
            Width = 63
            Height = 21
            Alignment = taRightJustify
            Caption = 'Portador'
          end
          object eValor: TDBEdit
            Left = 195
            Top = 59
            Width = 250
            Height = 29
            DataField = 'Valor'
            DataSource = dataCadastroSaldoPortador.dsCadastro
            TabOrder = 0
          end
          object rgReservado: TDBRadioGroupSimNao
            Left = 195
            Top = 94
            Width = 300
            Height = 65
            Caption = 'Reservado'
            Columns = 2
            DataField = 'Reservado'
            DataSource = dataCadastroSaldoPortador.dsCadastro
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 1
            Values.Strings = (
              'true'
              'false')
          end
          object rgContaCapital: TDBRadioGroupSimNao
            Left = 195
            Top = 165
            Width = 300
            Height = 65
            Caption = 'Conta Capital'
            Columns = 2
            DataField = 'ContaCapital'
            DataSource = dataCadastroSaldoPortador.dsCadastro
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 2
            Values.Strings = (
              'true'
              'false')
          end
          object lcbId_Portador: TDBLookupComboBox
            Left = 195
            Top = 236
            Width = 358
            Height = 29
            DataField = 'Id_Portador'
            DataSource = dataCadastroSaldoPortador.dsCadastro
            KeyField = 'IdPortador'
            ListField = 'NomePortador'
            NullValueKey = 8
            TabOrder = 3
          end
        end
      end
    end
    inherited pCabecalhoGeral: TPanel
      Width = 826
      ExplicitWidth = 824
      inherited lTitulo: TLabel
        Width = 774
        Height = 39
      end
      inherited sbSair: TSpeedButton
        Left = 783
        ExplicitLeft = 783
      end
    end
  end
  inherited alAcoes: TActionList
    object aTransferenciaPortador: TAction
      Category = 'consulta.Visualizacao'
      Caption = 'Transfer'#234'ncia Entre Portadores'
      OnExecute = aTransferenciaPortadorExecute
    end
  end
end
