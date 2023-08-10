object frameCadSaldoPortador: TframeCadSaldoPortador
  AlignWithMargins = True
  Left = 0
  Top = 0
  Width = 840
  Height = 120
  Align = alTop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pGeral: TPanel
    Left = 0
    Top = 0
    Width = 840
    Height = 120
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object pSaldos: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 44
      Width = 830
      Height = 69
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Right = 5
      TabOrder = 0
      object clSaldos: TControlList
        AlignWithMargins = True
        Left = 5
        Top = 38
        Width = 820
        Height = 31
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        ItemCount = 1
        ItemColor = clBtnFace
        ItemHeight = 30
        ItemMargins.Left = 0
        ItemMargins.Top = 0
        ItemMargins.Right = 0
        ItemMargins.Bottom = 0
        ParentColor = False
        TabOrder = 0
        OnBeforeDrawItem = clSaldosBeforeDrawItem
        object tPortador: TDBText
          AlignWithMargins = True
          Left = 63
          Top = 3
          Width = 200
          Height = 24
          Align = alLeft
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitHeight = 30
        end
        object tConta: TDBText
          AlignWithMargins = True
          Left = 269
          Top = 3
          Width = 200
          Height = 24
          Align = alLeft
          ExplicitLeft = 200
          ExplicitTop = 0
          ExplicitHeight = 30
        end
        object tTipo: TDBText
          AlignWithMargins = True
          Left = 495
          Top = 3
          Width = 200
          Height = 24
          Align = alLeft
          ExplicitLeft = 400
          ExplicitTop = 0
          ExplicitHeight = 30
        end
        object tSaldo: TDBText
          AlignWithMargins = True
          Left = 701
          Top = 3
          Width = 116
          Height = 24
          Align = alClient
          Alignment = taRightJustify
          ExplicitLeft = 592
          ExplicitTop = -8
          ExplicitWidth = 205
          ExplicitHeight = 30
        end
        object iConta: TImage
          Left = 472
          Top = 0
          Width = 20
          Height = 30
          Align = alLeft
          Center = True
          ParentShowHint = False
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
            001008060000001FF3FF6100000006624B474400FF00FF00FFA0BDA793000001
            EE4944415478DA6364A010306213945B95A8C5C4C8E0FFEFCF7FB5BFFFFE3330
            FCFD77EB1FC3AF0DCFE3565EC76B80D2AA34FE7F4C7FA6FFFFF73FE2FFDFFF8C
            FFFEFD63F80FC5FF802601C597FFFEC692F92E6FE9270C03409AFF32FD3DC2F0
            EF9F0E5033039A6620FD1FC6BFFCF7D7379B7779DB3FA118A0B0266919505124
            01CD603E9058F23677532CDC00909F818C2B589C0DD72CCCCCCDA0CA23C570E4
            D55590D8FFDFFFFE6A7F29DC7A1D6C80FCCA84AAFFFF185A716A66E26258EBD7
            0076A9F5D23C06A07EA02BFE557E2CD9D60171C1F284F940CD0920C52EC23A0C
            C6A2AA0C6DE75731008D816BE6606167F05D5DC9F0E4EB5BA8257FE77D2EDB99
            0C36407A69DC3CA08989200967615D86B99EA50C0B2FEE60E83FB786618D5F3D
            16CDFF40E134F76BC5AE1488018B63805EF8D70A73B6A78421C32CCF62866FBF
            7E32BCFBFE099B66B017BE56ED8178417251B8E6FF3F8C57819A19618A3C258C
            182AADA21942D6D763680606F6BF3F8C8CDABFAA76DD8047A3F89CF0A5400551
            880004E23FFFC00186A619E4CAC5DF6BF7C4A1A403A149D17CCC6C3F8E0035EB
            4234FC471884A2F9DFA5EF7FD96C191AD01212C4104F3E4626B669FFFEFE8F02
            6A66447736102EFDFE973507A6196766E2E9F7D664FEC3E0F7EFFF5F8D7FFFC0
            717EFD3703E326909F89CA8DA40000B8B2B9201B995C380000000049454E44AE
            426082}
          ShowHint = False
          Transparent = True
          ExplicitLeft = 402
          ExplicitTop = 1
        end
        object sbImages: TSpeedButton
          Left = 0
          Top = 0
          Width = 60
          Height = 30
          Margins.Left = 63
          Align = alLeft
          ImageName = 'ci54LogoBradesco'
          Images = dataImages.vil54
          Flat = True
        end
      end
      object pCabecalho: TPanel
        Left = 5
        Top = 0
        Width = 820
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lPortador: TLabel
          AlignWithMargins = True
          Left = 63
          Top = 3
          Width = 200
          Height = 27
          Margins.Left = 63
          Align = alLeft
          AutoSize = False
          Caption = 'Portador'
          ExplicitLeft = 3
        end
        object lConta: TLabel
          AlignWithMargins = True
          Left = 269
          Top = 3
          Width = 200
          Height = 27
          Align = alLeft
          AutoSize = False
          Caption = 'Conta'
          ExplicitLeft = 72
        end
        object lTipo: TLabel
          AlignWithMargins = True
          Left = 475
          Top = 3
          Width = 200
          Height = 27
          Align = alLeft
          AutoSize = False
          Caption = 'Tipo'
          ExplicitLeft = 129
          ExplicitHeight = 23
        end
        object lSaldo: TLabel
          AlignWithMargins = True
          Left = 681
          Top = 3
          Width = 136
          Height = 27
          Align = alClient
          Alignment = taRightJustify
          Caption = 'Saldo'
          ExplicitLeft = 777
          ExplicitWidth = 40
          ExplicitHeight = 21
        end
      end
    end
    object pSaldoMembro: TPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 830
      Height = 35
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Color = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lCabMembro: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 174
        Height = 25
        Align = alLeft
        AutoSize = False
        Caption = 'Membro Fam'#237'lia'
        Layout = tlCenter
      end
      object lMembroFamilia: TLabel
        AlignWithMargins = True
        Left = 185
        Top = 3
        Width = 200
        Height = 25
        Margins.Left = 5
        Align = alLeft
        AutoSize = False
        Caption = 'lMembroFamilia'
        Layout = tlCenter
        ExplicitLeft = 80
        ExplicitTop = 0
        ExplicitHeight = 31
      end
      object lCabSaldoGeral: TLabel
        AlignWithMargins = True
        Left = 391
        Top = 3
        Width = 200
        Height = 25
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Saldo Geral'
        Layout = tlCenter
        ExplicitLeft = 417
        ExplicitTop = 8
      end
      object lSaldoGeral: TLabel
        AlignWithMargins = True
        Left = 599
        Top = 3
        Width = 224
        Height = 25
        Margins.Left = 5
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = 'lSaldoGeral'
        Layout = tlCenter
        ExplicitLeft = 766
        ExplicitTop = 0
        ExplicitWidth = 80
        ExplicitHeight = 31
      end
    end
  end
end
