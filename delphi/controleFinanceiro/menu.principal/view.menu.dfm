object formMenu: TformMenu
  Left = 0
  Top = 0
  Caption = 'Finances'
  ClientHeight = 601
  ClientWidth = 968
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object svMenu: TSplitView
    Left = 0
    Top = 0
    Width = 150
    Height = 601
    CloseStyle = svcCompact
    OpenedWidth = 150
    Placement = svpLeft
    TabOrder = 0
    ExplicitHeight = 597
    object cbMenu: TCategoryButtons
      Left = 0
      Top = 0
      Width = 150
      Height = 601
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 40
      ButtonOptions = [boFullSize, boShowCaptions, boCaptionOnlyBorder]
      Categories = <
        item
          Caption = 'Cadastros'
          Color = 15395839
          Collapsed = False
          Items = <
            item
              Action = cadContaPagar
            end
            item
              Action = cadContaReceber
            end
            item
              Action = cadSaldoPortador
            end
            item
              Action = cadPortador
            end
            item
              Action = cadDespesaCartao
            end
            item
              Action = cadCartao
            end
            item
              Action = cadCredor
            end
            item
              Action = cadMembroFamilia
            end
            item
              Action = cadSaldoFGTS
            end
            item
              Action = cadTags
            end
            item
              Action = cadAbastecimentos
            end
            item
              Action = cadVeiculos
            end>
        end
        item
          Caption = 'Relat'#243'rios'
          Color = 16771839
          Collapsed = False
          Items = <
            item
              Action = relSaldoDetalhes
              Caption = 'Saldo Detalhes'
            end
            item
              Action = relAbastecimentos
            end>
        end
        item
          Caption = 'Aluguel'
          Color = 15466474
          Collapsed = False
          Items = <
            item
              Action = algCasa
            end>
        end>
      RegularButtonColor = clWhite
      SelectedButtonColor = 15132390
      TabOrder = 0
      ExplicitHeight = 597
    end
  end
  inline frameMenu: TframeMenu
    Left = 150
    Top = 0
    Width = 397
    Height = 601
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clFuchsia
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 150
    ExplicitHeight = 601
    inherited sbFrame: TScrollBox
      Height = 601
      ExplicitHeight = 597
      inherited pResumo: TPanel
        inherited lResumo: TLabel
          Width = 397
          Height = 29
        end
      end
      inherited pAdicionais: TPanel
        inherited lAdicionais: TLabel
          Width = 397
        end
        inherited pSaldoGeralMembros: TPanel
          inherited lValorSaldoGeral: TLabel
            Left = 239
            Width = 155
            Height = 24
          end
        end
      end
      inherited clContaPagamentos: TControlList
        inherited dbtSINAL: TDBText
          Height = 21
        end
      end
      inherited pContaPagamentos: TPanel
        inherited lContaPagamentos: TLabel
          Width = 397
          Height = 28
        end
      end
      inherited pProjecao: TPanel
        inherited lProjecao: TLabel
          Width = 128
          Height = 29
        end
        inherited pQtdMeses: TPanel
          inherited lMeses: TLabel
            Width = 70
            Height = 23
          end
        end
      end
    end
  end
  object aListaAcoes: TActionList
    Left = 656
    Top = 40
    object aAbrirRelatorios: TAction
      Category = 'Relat'#243'rios'
      Caption = 'Relatorios'
      OnExecute = aAbrirRelatoriosExecute
    end
    object aSair: TAction
      Category = 'template'
      Caption = 'Sair'
      ShortCut = 27
      OnExecute = aSairExecute
    end
    object aAbrirCadastros: TAction
      Category = 'Cadastros'
      Caption = 'aAbrirCadastros'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadCartao: TAction
      Category = 'Cadastros'
      Caption = 'Cart'#227'o'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadConta: TAction
      Category = 'Cadastros'
      Caption = 'Conta'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadCredor: TAction
      Category = 'Cadastros'
      Caption = 'Credor'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadDespesaCartao: TAction
      Category = 'Cadastros'
      Caption = 'Despesa Cart'#227'o'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadMembroFamilia: TAction
      Category = 'Cadastros'
      Caption = 'Membro Fam'#237'lia'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadPortador: TAction
      Category = 'Cadastros'
      Caption = 'Portador'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadSaldoFGTS: TAction
      Category = 'Cadastros'
      Caption = 'Saldo FGTS'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadSaldoPortador: TAction
      Category = 'Cadastros'
      Caption = 'Saldo Portador'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadTags: TAction
      Category = 'Cadastros'
      Caption = 'TAGs'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadContaPagar: TAction
      Category = 'Cadastros'
      Caption = 'Contas Pagar'
      OnExecute = aAbrirCadastrosExecute
    end
    object cadContaReceber: TAction
      Category = 'Cadastros'
      Caption = 'Contas Receber'
      OnExecute = aAbrirCadastrosExecute
    end
    object relSaldoDetalhadoPortador: TAction
      Category = 'Relat'#243'rios'
      Caption = 'Saldo Detalhado'
      OnExecute = aAbrirRelatoriosExecute
    end
    object relSaldoDetalhadoGrafico: TAction
      Category = 'Relat'#243'rios'
      Caption = 'Saldo - Gr'#225'fico'
      OnExecute = aAbrirRelatoriosExecute
    end
    object algCasa: TAction
      Category = 'Aluguel'
      Caption = 'Aluguel da Casa'
      OnExecute = aAbrirAluguelExecute
    end
    object aAbrirAluguel: TAction
      Category = 'Aluguel'
      Caption = 'aAbrirAluguel'
      OnExecute = aAbrirAluguelExecute
    end
    object relSaldoExtrato: TAction
      Category = 'Relat'#243'rios'
      Caption = 'Saldo - Extrato'
      OnExecute = aAbrirRelatoriosExecute
    end
    object relSaldoDetalhes: TAction
      Category = 'Relat'#243'rios'
      Caption = 'Saldo Detalhado'
      OnExecute = aAbrirRelatoriosExecute
    end
    object cadAbastecimentos: TAction
      Category = 'Cadastros'
      Caption = 'Abastecimentos'
      OnExecute = aAbrirCadastrosExecute
    end
    object relAbastecimentos: TAction
      Category = 'Relat'#243'rios'
      Caption = 'Abastecimentos'
      OnExecute = aAbrirRelatoriosExecute
    end
    object cadVeiculos: TAction
      Category = 'Cadastros'
      Caption = 'Ve'#237'culos'
      OnExecute = aAbrirCadastrosExecute
    end
  end
end
