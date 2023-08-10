object frameCadConta: TframeCadConta
  AlignWithMargins = True
  Left = 0
  Top = 0
  Width = 450
  Height = 415
  Align = alLeft
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
    Width = 450
    Height = 415
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'pGeral'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    object clConta: TControlList
      AlignWithMargins = True
      Left = 0
      Top = 64
      Width = 446
      Height = 347
      Hint = #201' conta anual'
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
      OnBeforeDrawItem = clContaBeforeDrawItem
      ExplicitLeft = 40
      ExplicitTop = 112
      object tDescricaoConta: TDBText
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 183
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        DataField = 'DESCRICAO'
        WordWrap = True
        ExplicitTop = 3
        ExplicitWidth = 283
      end
      object tValorConta: TDBText
        AlignWithMargins = True
        Left = 298
        Top = 5
        Width = 143
        Height = 20
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Alignment = taRightJustify
        DataField = 'VALOR'
        ExplicitLeft = 290
      end
      object iDebidaCartao: TImage
        Left = 233
        Top = 0
        Width = 20
        Height = 30
        Hint = 'D'#233'bito em Cart'#227'o'
        Align = alRight
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
          001408060000008D891D0D00000006624B474400FF00FF00FFA0BDA793000000
          E14944415478DA6364A03260A48981FFFFFF57025282149AF59E9191F11E23D0
          B02E20471B887F00B126101FC6A14104888390F8B3A0B423105F00621E20BE04
          32F03CD06443206D0C144803B2D3B19906953F03F71A1040C51701A98940EE59
          B05940623D50E00AD4FBA2641AF808C404622D9081EC40862F101B5060E05D20
          BE0AC49B18D13490EBE50E20F71A3C96470D1C3590A0818B81541B907B1DDD40
          7120B51A286147AC8140316620F324103B00B95F500C846AAA05526E407C0D8B
          99D80A0750EE9A0F346C06DC222C2E01B954868138701768D8076401DA14B0D4
          04007180C0130EAD06D50000000049454E44AE426082}
        ShowHint = True
        Visible = False
        ExplicitLeft = 45
        ExplicitTop = -16
        ExplicitHeight = 457
      end
      object iFolhaPagamento: TImage
        Left = 213
        Top = 0
        Width = 20
        Height = 30
        Hint = 'Pertence a Folha de Pagamento'
        Align = alRight
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
          001408060000008D891D0D00000006624B474400FF00FF00FFA0BDA793000000
          D34944415478DA6364A032601C35903A06FEFFFF5F0548F903F16732CDE105E2
          0D8C8C8C776106A602A9B940817FE49806D4CF04A49281FA67C30C4C03726691
          68883C50CF43243ED80C140381343F90AB82C79C4B4075BF81EAE2806C1B203E
          02E42FA28681C940B63810B703F9FF711A4862987501F11DA0BE19F85C280FE4
          BAA3E97F0494DB01948B01B2D701D9DF80EC30205B0AA415C89F480D177203A9
          14205E0ED4F78A620371588262A017906201E2A7649A270DC4BF81066E6744B2
          411D48F19069E017A06137418C2152380C6A03016396831572EED45A00000000
          49454E44AE426082}
        ShowHint = True
        Visible = False
        ExplicitLeft = 146
        ExplicitTop = -3
        ExplicitHeight = 457
      end
      object iPagamentoManual: TImage
        Left = 193
        Top = 0
        Width = 20
        Height = 30
        Hint = 'Pagamento Manual - Aguardando'
        Align = alRight
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
          001408060000008D891D0D00000006624B474400FF00FF00FFA0BDA793000001
          144944415478DA6364A032601C1E063E6E901102D1B20D4FDE516CE0F30645B3
          FFFF180F81D432FDFF6727D1FCE02445063EAD55CC6164649C0CE6FC67CC976A
          BE3B8922039FD529A7034D9A0131902153AAF9DE0CCABC5CA71CFF9FE1FF02B0
          E2FF8C8992CD771750E865E50846C6FFCB210E6488926EBAB79C322F37280730
          FCFBBF1EAA3C48AAE9EE7A0AC350C19D818169074431A39764D3DDED1419F8AA
          4141E2CF3FA6AB2036EB9FBF3AA26D0F9F536420085C6DD06603D1DA0D577F11
          524BD0C0470DB252CC7F596782D87F997FA7CB353C7E469181CF6B95EAFE3332
          348215FF67A8976CBED74491812F1A142CFEFD63DA09623331FD739768787082
          E230BC9DABC20EA25527DFF9497118920A06BF8100858F5D15D819EA02000000
          0049454E44AE426082}
        ShowHint = True
        Visible = False
        ExplicitLeft = 207
        ExplicitHeight = 457
      end
      object iCalender: TImage
        Left = 253
        Top = 0
        Width = 20
        Height = 30
        Hint = #201' conta anual'
        Align = alRight
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
          001408060000008D891D0D00000006624B474400FF00FF00FFA0BDA793000002
          C74944415478DAAD944F4814511CC7BF6FA66D5D6C3151D370534B2D45A3531D
          B208A46312D5A92882E8D0A553C89A12BB43E8AD3A74893C48884A99055987A2
          9BD5A1825A50C102C9D65C44FBC3AE7F7676E7BDD76F6766FFCC249D1CF8CDEF
          BD37EF7DDEF7F77EBF370C9BFC30F740DB9B25BFF416D5BE3BE89FFCDFC2C31F
          12AD4C4FCEBD3D5291D818D839550518E7EB5B8B8F96D5951EFAF82872178A87
          2B4200C280823479619AA2AFAA072EB55FFD35137DBF303133012E075747CE2D
          3A81C1483713BC77E72E15554D55883C9B06632A013858CE0CAB9F4EA2E56C1B
          963E7DC1F2D4022045CFDAF0853E27B02B12669C877CEA3AFC655E2C47D7C1A4
          CC436C33DB3C85F2BA12ACC67E425FE150A4A1AD0C5F0C3B80A5B7BF8E27E3FA
          09F00C20131E2C80A40617044F9BDE0A9BC63981A5BDC136FFF3C49DE31D0E60
          D3D86258488404BD2499E064D9B6E961FACC787ECCF65C687FAE353A15EE25A0
          E4D204E62793401B5C0828A104711AFF6DA8D646048C77BA81A3B1304514B226
          E4173B9548942B293C391D40D2103836340FC9B6401A528B075DC08687B1B030
          8199B0048AA58EB8E10175736A4DD8A96A3496FB107C3987FB936950DEE89BD0
          5682FB5CC0115228296452D151C971AB3D80CB2FE6F07A513117953127AC7F2A
          459B296634C800AFBB807B867E5052987986F5DE14463B02F06F557169FC1B3E
          2F19040B14C0D204638547A1ADF5B8807504A42AC865B9A148C7E39335F07B55
          C41269D46CF75AB0E94C982C77A656E68596BCD1EC020E92425190652AB1DD5E
          1D4FCFD4A2A2D883AE57DFED305941C2ACF3950601432E60CD83280159C85D63
          8DBE349A4B558CCD725B191CEAEC795AEA1FE040949292CDB2AB165D05ED2E25
          4A9A960ABB80D503F3DD54F1BD59C8062A50788B7237C7BA293DC6CD16E7CF61
          47FF6CA502CF15FAE8CB102DA8ED79B64F1373AA8579A509B86E18C63DF4ED77
          FDBE36E9D974E05F158075335B255BBD0000000049454E44AE426082}
        ShowHint = True
        Visible = False
        ExplicitLeft = 318
        ExplicitTop = 3
        ExplicitHeight = 457
      end
      object iDebitoAuto: TImage
        Left = 273
        Top = 0
        Width = 20
        Height = 30
        Hint = 'D'#233'bito Autom'#225'tico em Conta'
        Align = alRight
        Center = True
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
          001408060000008D891D0D00000006624B474400FF00FF00FFA0BDA793000001
          DB4944415478DA6364A032601C35907A063E2A11D7F9C7C8B411C8DC28DFFDBC
          1828F11F9FC6FFFF19189FEF53E8FDC7FCDFFF1FEB3F7F39EBC757E006420DDB
          07648A4254334E93EF799683CB509061CFB62A4D6164FE9FF59F15A884E5FFEB
          BFACFF9C4086820D7C502AB914484521BBFB1F13E334C50E4C434186BD5AA532
          E51F1BD03016B0610C504397493B3C8CC67421C80426208B09E4D0FFD3145B5F
          C00D051BB6487DCA7FD67F593083A086BE666262729270BF7B051E86F78BA534
          805ED80F344C82016CE07FB0C1FF18FECF56667A99C150CFF0FFF52CAD49FF59
          FEE5400CFB0773DD6B46B6FFCE12DEF72E63C4F2FD4A290DA041FB1918FF4B40
          0D63F8FBF73FC34FA13FB32598247F31B2FECFFE8FF022C8D0D70C2C7F9D25C2
          2086614D362043810AF7030D930019F65DE02F03F7475E06417E1E8441509701
          2D759648BC7119593FD67478BF414AE3D7EF3FFBBFF3FF95E079CBC720C8CD8B
          E42A10CD008C55A0CBD2510DC39BB02F760BEA303FE33A26C529CA8BE42A867F
          CC7F3FB3B0FFB712CABF7E056FC2C6062EA5C87849F20B6E666667660219FA9B
          F1F7BFB79FBFFA6AF53DDC4630A7E03654DE4B828F6F3303DB7F86979F3E84EA
          4E7BB20E9F7AA2F2F2F9742555106D38F3DE6D426A875069432D0000AF6FE115
          FE1C7D300000000049454E44AE426082}
        ShowHint = True
        Visible = False
        ExplicitLeft = 377
        ExplicitTop = -3
        ExplicitHeight = 457
      end
    end
    object gpCabecalho: TGridPanel
      Left = 0
      Top = 0
      Width = 446
      Height = 59
      Align = alTop
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 65.069296683067610000
        end
        item
          Value = 34.930703316932400000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = lTituloFamilia
          Row = 0
        end
        item
          Column = 1
          Control = lTituloTotal
          Row = 0
        end
        item
          Column = 1
          Control = tValorTotal
          Row = 1
        end
        item
          Column = 0
          Control = tMembroFamilia
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 1
      object lTituloFamilia: TLabel
        Left = 0
        Top = 0
        Width = 290
        Height = 30
        Align = alClient
        Alignment = taCenter
        Caption = 'Membro Fam'#237'lia'
        Layout = tlCenter
        ExplicitWidth = 118
        ExplicitHeight = 21
      end
      object lTituloTotal: TLabel
        Left = 290
        Top = 0
        Width = 156
        Height = 30
        Align = alClient
        Alignment = taCenter
        Caption = 'Valor Total'
        Layout = tlCenter
        ExplicitWidth = 81
        ExplicitHeight = 21
      end
      object tValorTotal: TDBText
        AlignWithMargins = True
        Left = 293
        Top = 33
        Width = 150
        Height = 23
        Align = alClient
        Alignment = taRightJustify
        DataField = 'VALORTOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 152
        ExplicitTop = 16
        ExplicitWidth = 65
        ExplicitHeight = 17
      end
      object tMembroFamilia: TDBText
        AlignWithMargins = True
        Left = 3
        Top = 33
        Width = 284
        Height = 23
        Align = alClient
        Alignment = taCenter
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 128
        ExplicitTop = 30
        ExplicitWidth = 279
        ExplicitHeight = 17
      end
    end
  end
end
