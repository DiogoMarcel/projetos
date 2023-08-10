object frameAluguelLancamento: TframeAluguelLancamento
  Left = 0
  Top = 0
  Width = 525
  Height = 452
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object pAluguel: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pAluguel'
    ShowCaption = False
    TabOrder = 0
    object gAluguel: TGridPanel
      Left = 0
      Top = 32
      Width = 525
      Height = 48
      Align = alClient
      BevelOuter = bvNone
      Caption = 'gAluguel'
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
          Control = lMesAno
          Row = 0
        end
        item
          Column = 0
          Control = lValor
          Row = 1
        end
        item
          Column = 1
          Control = dbtMesAno
          Row = 0
        end
        item
          Column = 1
          Control = dbtValorAluguel
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      ShowCaption = False
      TabOrder = 0
      object lMesAno: TLabel
        Left = 0
        Top = 0
        Width = 262
        Height = 24
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Mes/Ano'
        ExplicitLeft = 200
        ExplicitWidth = 62
        ExplicitHeight = 19
      end
      object lValor: TLabel
        Left = 0
        Top = 24
        Width = 262
        Height = 24
        Align = alClient
        Alignment = taRightJustify
        Caption = 'Valor'
        ExplicitLeft = 225
        ExplicitWidth = 37
        ExplicitHeight = 19
      end
      object dbtMesAno: TDBText
        AlignWithMargins = True
        Left = 265
        Top = 0
        Width = 250
        Height = 24
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alClient
        Alignment = taRightJustify
        ExplicitLeft = 392
        ExplicitTop = 16
        ExplicitWidth = 65
        ExplicitHeight = 17
      end
      object dbtValorAluguel: TDBText
        AlignWithMargins = True
        Left = 265
        Top = 24
        Width = 250
        Height = 24
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alClient
        Alignment = taRightJustify
        ExplicitLeft = 400
        ExplicitTop = 32
        ExplicitWidth = 65
        ExplicitHeight = 17
      end
    end
    object pAluguelCabecalho: TPanel
      Left = 0
      Top = 0
      Width = 525
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pAluguelCabecalho'
      ShowCaption = False
      TabOrder = 1
      object iPago: TImage
        AlignWithMargins = True
        Left = 496
        Top = 3
        Width = 26
        Height = 26
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000097048597300000B1300000B1301009A9C18
          000003414944415478DABD956B4853611880DFB3B3B986B75DF598DB9C79CD5B
          DA85B2D00C89404DEC8F90D50F11842811132167A261696414641111511019A9
          A499D18F882E8694940E455344A6333DCE79B6399B73EAB6BE73C81FC6265357
          EFF97138EFF7BEDFF3DEBEEF60B001296AAA8AA1DF0DB99707DDF5C1DC312ABC
          5FC891CBE32EC90389420CC3D8E35AED73EDF0706943718375CB00655B7D2621
          1455444A65C92C168BD1D91D76189B22BBC77553F57539175B3605B8D05A230B
          F016D7470407E7F87A7B73699DD6A067D6020542E63D6F365B472627DB66CCB3
          65374F544EB805A8AAAA62E1FB45C5414251490841C868DD827511A6F514A04C
          009508660C0610FBFB83F7361EE34352D4A49A9C7E30B0D079A539B7D9E61250
          D15A9F2612086AA2A4D2431C3607A34B819CC18BCD06095FB02690599311CC96
          45904902802E9DCD66875172F2BB46AFABBC9E5DF6660DA0A0A94418C10FAB56
          10D27CA19FAF0FADA34C73F0CB620129DA00FF53FBBFC559007366B365F8E7F8
          0B353555FA30AF4E8B295B6F1C0B0D0ABC2B2782C230C4B32C595139F420F1E7
          830F8FE7CE903181E8E68CA88442E07971C1811ECD3439AA26B5E7B0EA57B7CA
          0FC627D4221D90060AEC763B048B254E37D2A34D006381D0CFCFE93ADD1BEBCA
          3248913FDDABAEFE3E25038856842AF5A6391F0541001B67BB8CF4736F0F1D07
          24C7EF02361B776A43F742A3D3D2D99B46349A6B58594B6D86D506F2F4C4C47B
          3C2ED7A9D32C8AACFDE307A08C06E61B4759641D4E834885C2A9BDC56A85772A
          D5592E0E1AA6C9E79F5D4D39BA3BE9932BC0938E7630CECF43DADE7D28431CC8
          590AB64BC4101DBAC325E06D4F6FEA9D93159D6E016E373E057F345C67328F03
          CBC5446D09F0BEFB2B7C1B1C800074D00E2424405448E8BA97CC86010E87037A
          8786A04BA542CE16900804907D24DDE5346D18B02ACB2B2BD0F3639099264224
          865399599E01684812646884E9D9A6A5F1750750E84C14E59DF60CE0F1CB5630
          99175069F8B0804EADDE6482D8B070C84849F50C60744203436A354CE966D0BD
          C381D8F00848DA198DEE28DC338055F9D2DF071C9C057B62E2D6B5DB34607169
          09E83670395EFF06E0AEFC7F40416379A0821F948F7A66F704C06E03D698917C
          44FF707E039477B38BD4EC74A80000000049454E44AE426082}
        Proportional = True
        ExplicitLeft = 458
      end
      object lAluguel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 367
        Height = 26
        Align = alClient
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 72
        ExplicitHeight = 23
      end
      object iLetraP: TImage
        AlignWithMargins = True
        Left = 439
        Top = 3
        Width = 22
        Height = 26
        Margins.Left = 0
        Margins.Right = 0
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000097048597300000B1300000B1301009A9C18
          0000012D4944415478DA6364A031601C9E16C456FFB2F9CFC8608D4FE3FFFFFF
          5F30B2B06D5FD2C8F88A640BA2AB7F36303232D61376DFFFEFFF1918EB97B6B0
          759367C1FFFF47FF33301CC1A28B99E13F833E508D2BD81A0686325C96E0B500
          180C8D4B5BD91B70B92EBAE6670C2303E362904F1898D914B005174516402DD9
          0DB4C4056849FC9216F645D4B7A0FA671B506D25309C6A97B4B2B5D0C202BC6A
          29B620A6FAD76CA029294066D19216B67EAA5A105AFF5F88EDCFAFAB40B512C0
          7C63B7B499ED30552C001ACCC6F1E7B7D93FC6FFFDC008360146F029A0EB2D80
          C6FD27C9020622C0FFFF0C8FFEB3FC755CD6C8790F9B3C9916FCFF0BCCC18F18
          FFFF5FC7F897AD7D7107E35B5C2A298E644260D482416A416CF56F977F0CFF5C
          981898F62C6E65DD43750BA80986BE05004967CF19FF96C74D0000000049454E
          44AE426082}
        Proportional = True
        Stretch = True
        ExplicitLeft = 431
      end
      object iAguardando: TImage
        AlignWithMargins = True
        Left = 464
        Top = 3
        Width = 26
        Height = 26
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000097048597300000B1300000B1301009A9C18
          000004EE4944415478DA95557B4C53571CFE4A6F9FDC22D2D2521820E555A7F2
          704E9CC6A181389D539329B845DD867BB8CC2CD94397E1A350E610E71FBA6471
          71D9643EA7658BCEB78968B6252E9B2F8A6E2BA558C082F496026D6F9FF762D7
          D6C84094B25F727393F39DF3FBCEF9BD3E0EC6618B379D4AE1723899048F97CD
          0D06837E96350D06836D676A9774453BCB7912F052D549B1382656C313F01790
          64AC228E9448052281208CF9BD7EBFCBE5EA75B9696A9065CE0DDAEDDB1A7695
          7BC74DB0A2E6E25B42BEE013952A5D459212AE8BA6C1FA421F1388E03C1E1F5C
          2189380909A7C3C59ADB3BEE047C6C9DAE7A7EFD980455555531FF10C55F2727
          29962B9395D2815E2B88A01745B952146449418AB8917D2E0F8B26531FFE34DA
          C170C4484894C362B9374059AD3FE6B2BFACD36AB5F71F4BB072DBA56F549332
          568B49B1C861EDC06BA59998A64A18C26D0374E49F184F0EADE9DBFA70A8F10E
          E2E569A069DADB666E3FD0A02979771441382C2949CA1D32B92CC16BBF8BCA57
          F34237E68D99C05B2D66B49ABBB0A0B808DB7F6886382115948DEAEBE9A636E8
          AA4BEA8708CA3ED489840AA57EEAB429D9368B09556B0AA23A77D11E68BF3C88
          85F39E45E99CE9A0BD0CB407F590A766E256F35F2DFDDEFEE9A7B54B3D118272
          6D639D7A72F68680D7CD7D654E22F233A5514B77EF913370B8DCD8F076196262
          3843E13A76C506AE40CC9A5A5ABF38AA29D91C4156D5FD7A333F6F5A818B32A3
          E6F5C2A8CEFF6832E0F089466C797F15E4D2F811D8D6FA1B98A05441AFBF7DE3
          D0A7739FE12CDD7822593929EDAA42264B9E9916C4E25969633A0FDF5ABBFB20
          962D988DE2A2BC51F8A9DF3B70CD12032B457553DDB6199CA595A7E7E7A873CE
          F2C00AD7BF98861459EC98045FEDFF190CCBE283B5CBC1794C17596C34F69CB7
          8009727D06836921A74C73E1CDDC2993BF0DD0FDD8B4320701861D5186C36DD7
          773FA1B5BD1BDB3E7E0309F1925138152A63018FC0769D113C713C0C8696B59C
          15D5E72BD4EAA7F705DCD10976EF3B0E435B272ACA5E4051817A141EEE138220
          B043D71A22988016C3DF159C659B4FCDCBCEC93DC7E30C0AD72F4A8D1AA26BCD
          46D4375CC09A974B31AB70F29343749FEB35B61A173E48726A28C90A59F28CD4
          20963C377692A3919CBCD281EBDD5C503DD6AECE8E9E199134ADDEFEDBF5FC82
          A9D39DD6F19569D81E96EACE4DEF40C0FFAF2935DFDF445C52069A9A6E5F3F5C
          39F70141D967976AD5D9591B19BF87289F2D4561966C5C24FE0033C2B9BECD0E
          DD955EC4F0C56CABD158774C53BA3542505C7559982A22F479795372A8BB6DA1
          51911F75543C6A2E4F0035879B214FC982BEB9D9E8F0390A874645E415358D6B
          9549F29DF2447982A76F7CC36EB8F3BAA3B72096A681A2ACF69E1EEA239DA6E4
          40181BD12AE53517F7AA3232D69024291AA03AB1AA240305C3E652B8CEC30786
          97F14D532F8E5C6EC744793A9C2E97C76C36EFD7694ADF7B888F121C03F7F93D
          49498A15294F254BFB7B2970593766AAC3799142222622FB9C6E36E4D88EAB2D
          760C1224264AE5B8DB6519B052B606DD96F9EB426E838F25187A497563055FC0
          AF9CA44ACF9810272142FA1B924C37986192490863219148E07038D9F6F6CE3B
          8140E0F38761196E4F14FDB04670E3A59B09017F11192B5290717152A140280C
          633EBFCF473B9D769AF658FD8CEF2CFA076AFF97E83F6AE166049FC812104456
          308820C330A6180E613A5EBBE85EB4B3FF026C3420AB9EDC1237000000004945
          4E44AE426082}
        Proportional = True
        ExplicitLeft = 392
      end
      object iLetraC: TImage
        AlignWithMargins = True
        Left = 373
        Top = 3
        Width = 22
        Height = 26
        Margins.Left = 0
        Margins.Right = 0
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000097048597300000B1300000B1301009A9C18
          0000016E4944415478DAED953D4F02411086E7E58E454B3F0A1B296C6DC55861
          FC099A5888D869B4152C50480E222889466AB114684CFC0B46AD445B2D2DB0B0
          3296CA72DC38484C2431E45029304EB37B3B73F3CC6E32EF80BA6CF8DB80058B
          878DBADE64C61CC0A3126E343D5C97B307393B85AD768EB378EA1810B25EC660
          1B6700F9DB15C14C1536EB33A554FF7D07004638AEAF0808C8BE2C9FEB55D37B
          7392826E78E72D565EA716F0389CFB8829A4D594A4635780505C073DA073F9F1
          D1B1D578298BE72FE3623C0043DF01187198A64B1975E10A20D56F88674F0087
          85B46FADDD1385133A2FCB8A3C55B4985107AE008BF16A52AAB2983955CCF892
          F403FB07FC037A15104AE8A887685F9A272FCDB3DA2E8134E5916459966D44E4
          22E70EE0522A44930695AD6F1B52C1A060715B5DBA02B4881DF335089157D35B
          FE2C767D766DD201E7C437D1B1D8BDDFA2BB72DDB4A5180FB1A9B798300B627F
          CBC02154C03270EA6AF75B03E7B7ACF7016F8081E01918ABCBDA000000004945
          4E44AE426082}
        Proportional = True
        Stretch = True
        ExplicitLeft = 357
      end
      object iLetraO: TImage
        AlignWithMargins = True
        Left = 395
        Top = 3
        Width = 22
        Height = 26
        Margins.Left = 0
        Margins.Right = 0
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000097048597300000B1300000B1301009A9C18
          000001704944415478DAED953D4F02411086F7E58E454B3F0A1B296C6DC55861
          FC099A5888D869B4152C50480E222889466AB104AE31F12F18B5126DB5B4C0C2
          CA582ACBDD8D83C44412731E460A0CD3ECC7CCEE33BBC9BC03D165C3FF062C19
          34AAD96A9B080B008D73B8D6F290CD7B8FBC77064BEE95F278EE1810315E2760
          69E78008BA2541246AA4DB736666F0A10300219A54D70208F1BCCACBCDBAEEBF
          3DCD4035BD8B0649BFD308F91C2A7CC694B37286AF234F804852857D10177CF0
          C9B1E4A499C7CBB771091A82A6EE018C392466CD9CBCF404E0ECB7D873C080E3
          7236B0E1F645D1942AF2B0C65F15AFE4E49127C072B29EE6AC0C22CA547281B4
          1BE0A7D83EA00FE8554024A5E23E210EB9788A5C3CEB6E002ECA13BE6595A731
          968B82378047A9604D1A9696BA6B4A0541842BBBF2CA13A04DEC886E20107BD3
          FDD5AF62376035A61D50817D531D8BDDC72BBA2BD72D5B49D008E96A8704E621
          28D8D670046A206E38B6DCFF55C3F92BEB7DC03B7F1420284C214A9200000000
          49454E44AE426082}
        Proportional = True
        Stretch = True
        ExplicitLeft = 383
      end
      object iLetraM: TImage
        AlignWithMargins = True
        Left = 417
        Top = 3
        Width = 22
        Height = 26
        Margins.Left = 0
        Margins.Right = 0
        Align = alRight
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000097048597300000B1300000B1301009A9C18
          000001AE4944415478DAE595CD4A025114C7EF1947C76AD503F4B110DBDAA217
          A845BD41A0924945418B36411F230C822305ED230B099C89DE2088A027B045AB
          0C2484F6B5B2E6F374261544469D29DBD85DDC73EE70CEF9DDFFB9776680FDF1
          80E1032433FA5EC3C39A9213AEBD145916EB1341E0E38EAFE442C7FD00F85D9E
          A10168CF28F2C84B3F4052D455AAD40280274053C519A9D8EA553C7EA8C50058
          1900387F00449366DB6656F44A1EAD75DFBD76C700165A6BCF004476493B5B25
          5B50E5D0A67B71638901DE50F41B951AF705E0D08AD88C7B4260E8761692845C
          D532CAE4C66CC676A93F27BE004E6022A3172920ED7616D49A34B5A648B7E155
          AB07A3C29851F70D888BF5298E059E4905B4AB484918364DA3422D9C04C49592
          2C94DAF33C031C4B2A2EC8596B5741310764F214F818090467B359B07F0CE854
          615BE1778ED7ABCEA122C2A22A076FDDF23C031AFDD6CF2972DD51413DFF24D4
          0E5DB37B4516E67BE57906A4A48F69CBE42AAD3505F034CDA979E1612080E6F3
          02998D26405573A1A4973CCF00E783C6B3C07603609D76BEDDBF06F41BFF0890
          10B523C7AAB2B0EF07D02D6F08FFC9831E5F37551328A1EBEE88000000004945
          4E44AE426082}
        Proportional = True
        Stretch = True
        ExplicitLeft = 409
      end
    end
  end
  object pTotal: TPanel
    Left = 0
    Top = 422
    Width = 525
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pTotal'
    ShowCaption = False
    TabOrder = 1
    object lTotal: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 49
      Height = 24
      Align = alLeft
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 23
    end
    object dbtTotal: TDBText
      AlignWithMargins = True
      Left = 58
      Top = 0
      Width = 457
      Height = 30
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alClient
      Alignment = taRightJustify
      AutoSize = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 434
      ExplicitWidth = 81
      ExplicitHeight = 23
    end
  end
  object gCorpo: TGridPanel
    Left = 0
    Top = 80
    Width = 525
    Height = 342
    Align = alClient
    BevelOuter = bvNone
    Caption = 'gCorpo'
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = pDesconto
        Row = 1
      end
      item
        Column = 0
        Control = pCobranca
        Row = 0
      end>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 2
    object pDesconto: TPanel
      Left = 0
      Top = 171
      Width = 525
      Height = 171
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      ShowCaption = False
      TabOrder = 0
      object lDescontos: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 519
        Height = 23
        Align = alTop
        Caption = 'Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 99
      end
      object gDesconto: TDBGrid
        Left = 0
        Top = 29
        Width = 525
        Height = 117
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORCONTA'
            Title.Caption = 'Valor'
            Width = 150
            Visible = True
          end>
      end
      object pGestaoDesconto: TPanel
        Left = 0
        Top = 146
        Width = 525
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 1
        object sbExcluirDesconto: TSpeedButton
          AlignWithMargins = True
          Left = 472
          Top = 3
          Width = 50
          Height = 19
          Align = alRight
          DisabledImageIndex = 17
          ImageIndex = 6
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          StyleElements = [seClient]
          ExplicitLeft = 448
          ExplicitTop = 6
          ExplicitHeight = 35
        end
        object sbEditarDesconto: TSpeedButton
          AlignWithMargins = True
          Left = 416
          Top = 3
          Width = 50
          Height = 19
          Align = alRight
          DisabledImageIndex = 16
          ImageIndex = 5
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitLeft = 284
          ExplicitHeight = 35
        end
        object sbIncluirDesconto: TSpeedButton
          AlignWithMargins = True
          Left = 360
          Top = 3
          Width = 50
          Height = 19
          Align = alRight
          DisabledImageIndex = 18
          ImageIndex = 8
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitLeft = 288
          ExplicitTop = -5
          ExplicitHeight = 54
        end
      end
    end
    object pCobranca: TPanel
      Left = 0
      Top = 0
      Width = 525
      Height = 171
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pCobranca'
      ParentColor = True
      ShowCaption = False
      TabOrder = 1
      object lCobrancas: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 519
        Height = 23
        Align = alTop
        Caption = 'Cobrancas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 99
      end
      object gCobranca: TDBGrid
        Left = 0
        Top = 29
        Width = 525
        Height = 117
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORCONTA'
            Title.Caption = 'Valor'
            Width = 150
            Visible = True
          end>
      end
      object pGestaoCobranca: TPanel
        Left = 0
        Top = 146
        Width = 525
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'pGestaoCobranca'
        ShowCaption = False
        TabOrder = 1
        object sbIncluirCadastro: TSpeedButton
          AlignWithMargins = True
          Left = 360
          Top = 3
          Width = 50
          Height = 19
          Align = alRight
          DisabledImageIndex = 18
          ImageIndex = 8
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitLeft = 280
          ExplicitTop = 43
          ExplicitHeight = 54
        end
        object sbEditarCadastro: TSpeedButton
          AlignWithMargins = True
          Left = 416
          Top = 3
          Width = 50
          Height = 19
          Align = alRight
          DisabledImageIndex = 16
          ImageIndex = 5
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient]
          ExplicitLeft = 284
          ExplicitHeight = 35
        end
        object sbExcluirCadastro: TSpeedButton
          AlignWithMargins = True
          Left = 472
          Top = 3
          Width = 50
          Height = 19
          Align = alRight
          DisabledImageIndex = 17
          ImageIndex = 6
          Images = dataImages.il16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlightText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          StyleElements = [seClient]
          ExplicitLeft = 340
          ExplicitHeight = 35
        end
      end
    end
  end
end
