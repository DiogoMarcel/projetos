inherited formCadSaldoPortador: TformCadSaldoPortador
  PixelsPerInch = 96
  TextHeight = 13
  inherited pGeral: TPanel
    inherited cpCadastros: TCardPanel
      inherited cConsulta: TCard
        inherited cpConsultas: TCardPanel
          inherited cConsultaGrade: TCard
            object sbConsultaGrade: TScrollBox
              Left = 0
              Top = 0
              Width = 832
              Height = 437
              HorzScrollBar.Visible = False
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
        end
        inherited pCabecalhoConsulta: TPanel
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
            Font.Color = clHighlightText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            StyleElements = [seClient, seBorder]
          end
        end
      end
      inherited cCadastro: TCard
        inherited pCadastro: TPanel
          ExplicitLeft = 48
          ExplicitTop = 96
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
      inherited lTitulo: TLabel
        Width = 780
        Height = 39
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
