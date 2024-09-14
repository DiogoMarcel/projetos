object fReport: TfReport
  Left = 0
  Top = 0
  Caption = 'fReport'
  ClientHeight = 815
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = datas.sourceMovimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand4: TRLBand
      Left = 38
      Top = 741
      Width = 718
      Height = 16
      BandType = btFooter
      object RLSystemInfo3: TRLSystemInfo
        Left = 648
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Text = 'Data:'
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 578
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Info = itHour
        Text = 'Hora:'
      end
    end
    object RLSubDetail1: TRLSubDetail
      Left = 38
      Top = 38
      Width = 718
      Height = 25
      DataSource = datas.sourceMovimento
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        Color = clWhite
        ParentColor = False
        Transparent = False
        object dbCaixa: TRLDBText
          AlignWithMargins = True
          Left = 62
          Top = 3
          Width = 90
          Height = 18
          Alignment = taCenter
          DataField = 'nomeCaixa'
          DataSource = datas.sourceMovimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Text = ''
          Transparent = False
          BeforePrint = dbCaixaBeforePrint
        end
        object RLDBText1: TRLDBText
          Left = 622
          Top = 3
          Width = 93
          Height = 19
          Alignment = taRightJustify
          DataField = 'troco'
          DataSource = datas.sourceMovimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = 'Troco '
          Transparent = False
          BeforePrint = dbCaixaBeforePrint
        end
      end
    end
    object RLSubDetail2: TRLSubDetail
      Left = 38
      Top = 63
      Width = 718
      Height = 95
      DataSource = datas.sourceMovFichas
      object RLBand5: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 25
        Color = clWhite
        ParentColor = False
        Transparent = False
        object dbVlrFichas: TRLDBText
          Left = 343
          Top = 4
          Width = 42
          Height = 16
          DataField = 'parcial'
          DataSource = datas.sourceMovFichas
          Text = ''
          Transparent = False
        end
        object RLDBText3: TRLDBText
          Left = 156
          Top = 4
          Width = 62
          Height = 16
          DataField = 'valorFicha'
          DataSource = datas.sourceMovFichas
          Text = ''
          Transparent = False
        end
        object RLDBText4: TRLDBText
          Left = 3
          Top = 4
          Width = 67
          Height = 16
          DataField = 'quantidade'
          DataSource = datas.sourceMovFichas
          Text = ''
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 694
          Top = 4
          Width = 21
          Height = 16
          Alignment = taRightJustify
          DataField = 'log'
          DataSource = datas.sourceMovFichas
          Text = ''
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 486
          Top = 4
          Width = 69
          Height = 16
          DataField = 'nomeCaixa'
          DataSource = datas.sourceGeralFicha
          Text = ''
          Transparent = False
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 40
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 3
          Top = 20
          Width = 70
          Height = 16
          Caption = 'Quantidade'
        end
        object RLLabel2: TRLLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          Margins.Left = 20
          Align = faTop
          Caption = 'Fichas'
          Color = 14079702
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLLabel3: TRLLabel
          Left = 156
          Top = 20
          Width = 34
          Height = 16
          Caption = 'Valor'
        end
        object RLLabel4: TRLLabel
          Left = 343
          Top = 20
          Width = 44
          Height = 16
          Caption = 'Parcial'
        end
        object RLLabel9: TRLLabel
          Left = 663
          Top = 20
          Width = 52
          Height = 16
          Alignment = taRightJustify
          Caption = 'Registro'
        end
        object RLLabel25: TRLLabel
          Left = 486
          Top = 20
          Width = 37
          Height = 16
          Caption = 'Caixa'
        end
      end
      object RLBand2: TRLBand
        Left = 0
        Top = 65
        Width = 718
        Height = 30
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object RLDBResult2: TRLDBResult
          Left = 371
          Top = 6
          Width = 262
          Height = 19
          DataField = 'parcial'
          DataSource = datas.sourceMovFichas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = 'Valor total em fichas '
          BeforePrint = RLDBResult2BeforePrint
        end
      end
    end
    object RLSubDetail3: TRLSubDetail
      Left = 38
      Top = 158
      Width = 718
      Height = 105
      DataSource = datas.sourceMovRetirada
      object RLBand6: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 40
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel5: TRLLabel
          Left = 3
          Top = 21
          Width = 93
          Height = 16
          Caption = 'Tipo da retirada'
        end
        object RLLabel6: TRLLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          Margins.Left = 20
          Align = faTop
          Caption = 'Retiradas'
          Color = 14079702
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLLabel7: TRLLabel
          Left = 235
          Top = 21
          Width = 34
          Height = 16
          Caption = 'Valor'
        end
        object RLLabel10: TRLLabel
          Left = 663
          Top = 21
          Width = 52
          Height = 16
          Alignment = taRightJustify
          Caption = 'Registro'
        end
        object RLLabel26: TRLLabel
          Left = 486
          Top = 21
          Width = 37
          Height = 16
          Caption = 'Caixa'
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 25
        Color = clWhite
        ParentColor = False
        Transparent = False
        object lRetiradasValor: TRLDBText
          Left = 235
          Top = 4
          Width = 30
          Height = 16
          DataField = 'valor'
          DataSource = datas.sourceMovRetirada
          Text = ''
          Transparent = False
        end
        object RLDBText8: TRLDBText
          Left = 3
          Top = 4
          Width = 25
          Height = 16
          DataField = 'tipo'
          DataSource = datas.sourceMovRetirada
          Text = ''
          Transparent = False
        end
        object RLDBText9: TRLDBText
          Left = 694
          Top = 4
          Width = 21
          Height = 16
          Alignment = taRightJustify
          DataField = 'log'
          DataSource = datas.sourceMovRetirada
          Text = ''
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 486
          Top = 4
          Width = 69
          Height = 16
          DataField = 'nomeCaixa'
          DataSource = datas.sourceGeralRetirada
          Text = ''
          Transparent = False
        end
      end
      object RLBand8: TRLBand
        Left = 0
        Top = 65
        Width = 718
        Height = 30
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLDBResult1: TRLDBResult
          Left = 371
          Top = 5
          Width = 270
          Height = 19
          DataField = 'valor'
          DataSource = datas.sourceMovRetirada
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = 'Valor total em retiradas '
          BeforePrint = RLDBResult1BeforePrint
        end
      end
    end
    object RLSubDetail4: TRLSubDetail
      Left = 38
      Top = 263
      Width = 718
      Height = 118
      DataSource = datas.sourceFecFicha
      object RLBand9: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 65
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel8: TRLLabel
          Left = 3
          Top = 47
          Width = 70
          Height = 16
          Caption = 'Quantidade'
        end
        object RLLabel11: TRLLabel
          AlignWithMargins = True
          Left = 0
          Top = 25
          Width = 718
          Height = 18
          Margins.Left = 20
          Align = faTop
          Caption = 'Fichas'
          Color = 14079702
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLLabel12: TRLLabel
          Left = 156
          Top = 47
          Width = 34
          Height = 16
          Caption = 'Valor'
        end
        object RLLabel13: TRLLabel
          Left = 343
          Top = 47
          Width = 44
          Height = 16
          Caption = 'Parcial'
        end
        object RLLabel14: TRLLabel
          Left = 663
          Top = 47
          Width = 52
          Height = 16
          Alignment = taRightJustify
          Caption = 'Registro'
        end
        object RLLabel15: TRLLabel
          Left = 0
          Top = 0
          Width = 718
          Height = 25
          Align = faTop
          Alignment = taCenter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Caption = 'Fechamento do caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Layout = tlCenter
          ParentFont = False
        end
        object RLLabel28: TRLLabel
          Left = 486
          Top = 47
          Width = 37
          Height = 16
          Caption = 'Caixa'
        end
      end
      object RLBand10: TRLBand
        Left = 0
        Top = 65
        Width = 718
        Height = 25
        Color = clWhite
        ParentColor = False
        Transparent = False
        object dbFechaFichaParcial: TRLDBText
          Left = 343
          Top = 4
          Width = 42
          Height = 16
          DataField = 'parcial'
          DataSource = datas.sourceFecFicha
          Text = ''
          Transparent = False
        end
        object RLDBText10: TRLDBText
          Left = 156
          Top = 4
          Width = 62
          Height = 16
          DataField = 'valorFicha'
          DataSource = datas.sourceFecFicha
          Text = ''
          Transparent = False
        end
        object RLDBText11: TRLDBText
          Left = 3
          Top = 4
          Width = 67
          Height = 16
          DataField = 'quantidade'
          DataSource = datas.sourceFecFicha
          Text = ''
          Transparent = False
        end
        object RLDBText12: TRLDBText
          Left = 694
          Top = 4
          Width = 21
          Height = 16
          Alignment = taRightJustify
          DataField = 'log'
          DataSource = datas.sourceFecFicha
          Text = ''
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 486
          Top = 4
          Width = 69
          Height = 16
          DataField = 'nomeCaixa'
          DataSource = datas.sourceGeralFecFicha
          Text = ''
          Transparent = False
        end
      end
      object RLBand11: TRLBand
        Left = 0
        Top = 90
        Width = 718
        Height = 21
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object totalFecFicha: TRLDBResult
          Left = 435
          Top = 1
          Width = 242
          Height = 18
          DataField = 'parcial'
          DataSource = datas.sourceFecFicha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
          Text = 'Valor total em fichas '
          BeforePrint = totalFecFichaBeforePrint
        end
      end
    end
    object RLSubDetail5: TRLSubDetail
      Left = 38
      Top = 381
      Width = 718
      Height = 125
      DataSource = datas.sourceFecSaldo
      object RLBand12: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 44
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel16: TRLLabel
          Left = 3
          Top = 24
          Width = 93
          Height = 16
          Caption = 'Tipo da retirada'
        end
        object RLLabel17: TRLLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 718
          Height = 18
          Margins.Left = 20
          Align = faTop
          Caption = 'Saldo'
          Color = 14079702
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLLabel18: TRLLabel
          Left = 235
          Top = 24
          Width = 34
          Height = 16
          Caption = 'Valor'
        end
        object RLLabel19: TRLLabel
          Left = 663
          Top = 24
          Width = 52
          Height = 16
          Alignment = taRightJustify
          Caption = 'Registro'
        end
        object RLLabel29: TRLLabel
          Left = 486
          Top = 24
          Width = 37
          Height = 16
          Caption = 'Caixa'
        end
      end
      object RLBand13: TRLBand
        Left = 0
        Top = 44
        Width = 718
        Height = 25
        Color = clWhite
        ParentColor = False
        Transparent = False
        object dbFecSaldoValor: TRLDBText
          Left = 235
          Top = 4
          Width = 30
          Height = 16
          DataField = 'valor'
          DataSource = datas.sourceFecSaldo
          Text = ''
          Transparent = False
        end
        object RLDBText14: TRLDBText
          Left = 3
          Top = 4
          Width = 25
          Height = 16
          DataField = 'tipo'
          DataSource = datas.sourceFecSaldo
          Text = ''
          Transparent = False
        end
        object RLDBText15: TRLDBText
          Left = 694
          Top = 4
          Width = 21
          Height = 16
          Alignment = taRightJustify
          DataField = 'log'
          DataSource = datas.sourceFecSaldo
          Text = ''
          Transparent = False
        end
        object RLDBText13: TRLDBText
          Left = 486
          Top = 4
          Width = 69
          Height = 16
          DataField = 'nomeCaixa'
          DataSource = datas.sourceGeralFecRetirada
          Text = ''
          Transparent = False
        end
      end
      object RLBand14: TRLBand
        Left = 0
        Top = 69
        Width = 718
        Height = 50
        BandType = btFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object totalFecRetirada: TRLDBResult
          Left = 435
          Top = 1
          Width = 225
          Height = 18
          DataField = 'valor'
          DataSource = datas.sourceFecSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Info = riSum
          ParentFont = False
          Text = 'Valor total em saldo '
          BeforePrint = totalFecRetiradaBeforePrint
        end
        object lTotalFechamento: TRLLabel
          Left = 435
          Top = 26
          Width = 44
          Height = 19
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          BeforePrint = lTotalFechamentoBeforePrint
        end
      end
    end
    object RLBand15: TRLBand
      Left = 38
      Top = 506
      Width = 718
      Height = 235
      BandType = btSummary
      object RLLabel20: TRLLabel
        Left = 0
        Top = 10
        Width = 718
        Height = 20
        Align = faWidth
        Alignment = taCenter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Caption = 'Resumo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object RLLabel21: TRLLabel
        Left = 105
        Top = 32
        Width = 56
        Height = 16
        Alignment = taRightJustify
        Caption = 'Retirado:'
      end
      object RLLabel22: TRLLabel
        Left = 81
        Top = 53
        Width = 80
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fechamento:'
      end
      object RLLabel23: TRLLabel
        Left = 39
        Top = 74
        Width = 122
        Height = 16
        Alignment = taRightJustify
        Caption = 'Saldo Inicial / Troco:'
      end
      object RLLabel24: TRLLabel
        Left = 120
        Top = 95
        Width = 41
        Height = 16
        Alignment = taRightJustify
        Caption = 'Saldo:'
      end
      object lResRetirado: TRLLabel
        Left = 167
        Top = 32
        Width = 78
        Height = 16
        BeforePrint = lResRetiradoBeforePrint
      end
      object lResFechamento: TRLLabel
        Left = 167
        Top = 53
        Width = 102
        Height = 16
        BeforePrint = lResFechamentoBeforePrint
      end
      object RLLabel27: TRLLabel
        Left = 389
        Top = 53
        Width = 48
        Height = 16
        Caption = 'Parcial:'
      end
      object lResParcial: TRLLabel
        Left = 460
        Top = 53
        Width = 70
        Height = 16
        BeforePrint = lResParcialBeforePrint
      end
      object lResTroco: TRLLabel
        Left = 167
        Top = 74
        Width = 62
        Height = 16
        BeforePrint = lResTrocoBeforePrint
      end
      object lResSaldo: TRLLabel
        Left = 167
        Top = 95
        Width = 63
        Height = 16
        BeforePrint = lResSaldoBeforePrint
      end
      object lStatusCaixa: TRLLabel
        Left = 389
        Top = 95
        Width = 78
        Height = 16
        BeforePrint = lStatusCaixaBeforePrint
      end
      object RLLabel32: TRLLabel
        Left = 49
        Top = 152
        Width = 112
        Height = 16
        Alignment = taRightJustify
        Caption = 'Retiradas + Saldo:'
      end
      object RLLabel33: TRLLabel
        Left = 53
        Top = 173
        Width = 108
        Height = 16
        Alignment = taRightJustify
        Caption = 'Vendas de fichas:'
      end
      object RLLabel34: TRLLabel
        Left = 43
        Top = 194
        Width = 118
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor final do caixa:'
      end
      object RLLabel35: TRLLabel
        Left = 99
        Top = 215
        Width = 62
        Height = 16
        Alignment = taRightJustify
        Caption = 'Diferen'#231'a:'
      end
      object lResRetSaldo: TRLLabel
        Left = 167
        Top = 152
        Width = 83
        Height = 16
        BeforePrint = lResRetSaldoBeforePrint
      end
      object lResVendaFicha: TRLLabel
        Left = 167
        Top = 173
        Width = 99
        Height = 16
        BeforePrint = lResVendaFichaBeforePrint
      end
      object lResValorFinal: TRLLabel
        Left = 167
        Top = 194
        Width = 97
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        BeforePrint = lResValorFinalBeforePrint
      end
      object lResDiferenca: TRLLabel
        Left = 167
        Top = 215
        Width = 84
        Height = 16
        BeforePrint = lResDiferencaBeforePrint
      end
      object RLLabel40: TRLLabel
        Left = 0
        Top = 130
        Width = 718
        Height = 16
        Align = faWidth
        Alignment = taCenter
        Caption = 'Detalhes'
      end
      object iSaldoCaixa: TRLImage
        Left = 363
        Top = 91
        Width = 20
        Height = 20
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000002580000
          02580806000000BE6698DC00005D814944415478DAECDD07B81D55D5C6F17593
          90104342098240E8BD4300918E0202D28B52A586AA42E8D244BA4A4B50E9BD77
          302055A4CB87D202A129480F2DA1A4101248EEB716FB5E73B9DC72CAEC59B3E7
          FC7FCFB39F7D5338B3E66466F6CB99397B37090064A459A449BB59B5CDDE491B
          A86D466D7DB4F56ED7FA74F3EBDE2D9B99D2AE4DEEE6D7ADBFF785B6B1DAC674
          D23E69FA7A1700A07E4DDE050028BEE6108C16D4B680B6F9B47D57BE1D9CAC9F
          4D5B4FEF7A6B3455DBC712C256FB20F691B6B7B4BDA1EDF5A6F0E700D0290216
          000B50334B084F0B76D2F7F7AEB160C64B4BD8EAA8D70BEB67DE0502F045C002
          1A8486A8BEDA2DAD6DD9967E41991EA066F5AEAF643E91E981CBDA0BDA9EB75E
          2FBA93BC8B03101F010B289996E7A0169210A4966BD32FA2AD87777D0D6E9AB6
          57B53D272170B5F6FFE5F92FA05C085840C29AC3334F6D4394F5CB68EBE75D1B
          AA3251DB28F966E87AAE293C13062041042C2011CDE1E1F115B4ADD1D256D736
          C8BB2E44F58EB67F687BACA53DDB141EC6075070042CA0A034500DD06E35991E
          A856153E996A74F649D713323D703DAE17F171DE4501F836021650101AA8E697
          E961CA9ADDEEE3992974C59EE9B25B8B8F4A4BE8D28BFA9BDE45012060016E9A
          C37C521B695B4F42A09AC7BB2694C2BB12C2D6FDDAEE6E0AF37701C819010BC8
          497398897C2D6D1B4B08564B7BD78486605344DCADED2E6D8F348599ED014446
          C002226AB9EDB7714BFB91B699BC6B42439BA0EDEF12C2D65DDC4E04E2216001
          196AF9946A6D991EAA96F4AE09E8C24BD212B6B43DCCA75B40760858409D5AD6
          E9DB4ADBE6123EA5E29B7E48917D43D13EDD1AA1ED56D65B04EA43C0026AA0A1
          6A16EDB6D4B69DB6F5B5F5F2AEA974669841A46FDFD0669C31B42FBF14F9FC73
          912FBE1099344964F264EF2ACBEA2B6D7FD376BDB6DB74A0F8D4BB202035042C
          A0422DF352D9A75416AA7E2CE176207AEBDB30D75C22DFFD6E0841ADA1A87DEB
          EACF3AFAF39E3DBBDFF6B469216CB506AEB6E1ABB5B5FDB3B6BF6EFBE7AD7FF6
          A9E68877DF0DBF462BBB6D78AF84B0358279B780CA10B0802E3487DB7D9B4908
          55F64C551FEF9A7237EBAC2273CF1DDA3CF34CEF5B7F9E7D76BD9294EC52F2D9
          6721688D1E1D9AFDDCF6D71F7D14C25DE3B18F0CED792D0B5BB73785DB8A003A
          50B2AB22503F0D557DB5DB4442A8B2BEAF774DD1F4EA25F2BDEF751C9C5ADB77
          BEE35D65F1D8ADCAF7DEEB3C8059B34FC4CACD76F0AF12C2D65F9BC2AF01B420
          60012D9AC31C557B69DB5ACAF4A0BADD6E5B724991A596121934E89B9F46CD31
          87480F268B8FE2934FBE1DBC5E794564D4A8F067E5629F64DDA2ED421D541EF1
          2E06280202161A9A86AAD9B5DB55DB106D4B78D75337FBB4C982D432CB882CBB
          6CE8175EB8B2E799901F0B5DCF3F1FC2566BFFF1C7DE5565E5656D1769BB5C07
          9831DEC5005E08586838CDE1B8B7E569ECD32AFB26609A0FABB786290B526DC3
          149F48A5C96E395AD86A1BBCC6263D53823D1C7F9BB60BB5DDDFF4F5A907340E
          02161A865EDDE7D26E776D7B6A5BC8BB9EAAF4EB27B2F4D2DFFC646AA1850853
          65F7FEFBDF0E5D6392FC50E8BFDA2ED676A90E3AEF791703E481808552D35065
          F7C66CDD3FFBB4CA1E582FFE7C5533CD14C2546B90B27E81050853082C74BDF0
          C23783D7871F7A5755299B5FCB1E8CB74FB56C21EAA9DE0501B110B0504A1AAC
          BEA7DDBE123EAD1AE45D4F976CFEA71FFC40649D7544D65A2B7C3255B6690F10
          D7071F883CFEB8C8430F893CFC702ACF73BD23E153ADF3F4687FDFBB18206B5C
          C5512A1AAC96D6EE606D3B4991E7ACB267A52C50595B7555ADB4B8A52231363F
          977DAA6561EBC10745468E14995AE80F8A6C6EADABB59DA903D20BDEC5005921
          60A1149AC31A80874AB81D58BCE3DA1E485F7D759175D70DA16A50B13F544389
          D8ECF48F3E1A0297359B24B598EC21F8BBB59DDE14D644049256BC8108A85073
          789ECA26033D44DB8ADEF57CCBE28B873065A16AE595C3DA7A80A7663D6B5E7A
          297CB26561EBA9A78AFAE9D633DACED0767D53786E0B480E010BC9695913706F
          6D07689BD7BB9EFF19A065ADB1C6F45B7F36433A50641326844FB75A03D7FB85
          7B14EA6D6D676BBB803510911A021692D11CC2D48112BE1138C0BB9EAF1F44B7
          6FFBB5DEF65B714526F444DAFEFDEFE9B712FFF9CFB024503158B8B26F1E0E6F
          0AA10B283C02160A4F83D532DA1DA9ED67E23DCD82852A7B966ACB2D457EF843
          918103BDDF1E208ECF3F17F9C73F44468C10B9F75E91C993BD2B3276BBF0066D
          A7EA9938CABB18A02B042C149606ABC5B5FBAD8460E53B0994CD43B5CD36225B
          6F1DD6F1031AC9F8F12277DC2172D34D224F3FED5D8D99262168FD5607B157BC
          8B013A42C042E1348759D68F9330D582DF3D379BF073934D44B6DD363CA40E40
          E4F5D7456EBE59E4965BC2F23EBEEC097D9BE2E1F8A6305B3C5018042C148606
          ABF9B43B56DB6EE2752BD0664BB707D5EDD3AA0D370C938002F8369B6FCB2637
          B54FB5EEB94764D224CF6AECD6E165DA4ED441ED2DEFB70630042CB8D36065F7
          DC8E92F0F0BACFC2CB367B7AEB2D40BEFD075467E24491BFFE3584AD279F0CD3
          41F8B005A6ED61F85374701BEDFDB6A0B111B0E0462FC17368F76B6DFB69CBFF
          A3229B5661D34DC32DC0158B378D1690A4B7DE9A7E0BF19D77BCAAF842DBB9DA
          7EA7835C320B35A25C0858C89D062BFBEADD61DA7EA9AD5FAE1BB76914D65C33
          84AA0D3660891A2016FB14EB892742D8BAF3CEF0ADC4FC4DD4F6276DA7E96037
          D6FB2D416321602137CD616D405B27D0A65CE89FEBC6175924842A9B5E61CE39
          BDDF0AA0B158B8BAEBAE10B6FEEFFF3C6E218ED776AA84F50E0B31DF04CA8F80
          855CE8E5741BED4ED3B6606E1BB539ABEC53AA7DF611193CD8FB2D0060ECB6E1
          C5178B5C7FBDC783F1AF6B3B4CAF0C377BBF0D283F0216A2D260B58276C3B4AD
          93DB467BF50A9F5459B0B24FAE0014CF279F885C7699C815578405A9F3F590B6
          A13A003EEBFD36A0BC085888A2E501F693B4ED29794D12FA9DEF88ECB083C890
          217C13104885DD3EBCF65A918B2ECA7B2D449BACF4626DC7F0203C6220602153
          CD619A055B84D9E6B3CA67BDC0596715D96D37915D7611996516EFB700402D6C
          DDC35B6F1539FF7C91FFE63A67A8AD7378A2B6B39BC2340F40260858C88C86AB
          CDB43B43DBA2B96CD096ACD96B2F91EDB613E9DBD77BF70164C12630B5B50FCF
          3D57E4B9E7F2DCF27FB41DA283E2EDDE6F01CA818085BA69B05A5ABBB3B46D90
          CB06175B2C3C5FB5C51661DA0500E5648B4D5BD07AF4D13CB77A9FB68374707C
          C17BF7913602166AD61CA65A3859DBFE92C79A81F64DC0FDF613596FBDF00D41
          008DE1F9E745CE3B4FE4EEBBC3275CF1D91A87E7683BBA294CF100548D510A35
          D170B5A98499920745DFD80F7F1882D52AAB78EF36004F6FBC119ED1B259E2A7
          E4F2B8944D45BF9F0E947778EF3AD243C042555ABE1D385CDBF6513764B7FE6C
          199B7DF715596209EFDD0650241F7C10E6D2BAE69AB00E627CD7693B906F1BA2
          1A042C544CC3D52EDA9D2961A99B38ECD69FCDB8FEAB5F89CC3BAFF72E0328B2
          71E3442EB944E4820BF298B4D496DA3958AF505778EF36D240C042B734582DA0
          DDF9DA7E1C7543F68CD56F7F2BB2ECB2DEBB0C2025367FD6A9A78A8C1891C7D6
          EED5B68F0E9E6F78EF368A8D80854E358709426D4E2B9B3034DEA2CC3629E811
          47846F05F2F03A805A3DF9A4C8F1C78B8C1A157B4B765FF218097367E5F2D43D
          D2C368860E69B8B28F912ED2F6FD681BE9D327CC63650FB0DB2CEC00502FFB96
          E18D378A9C769AC8D8B1B1B7F64F6D4374207DDE7BB7513C042C7C83062B4D3D
          5FFF9FD911DA6688B6A18D361239FA689141F1BF8408A0014D982072F6D92297
          5E2AF2D55731B7F4A5B6DF6B3B4907D4C9DEBB8DE22060E17F345C0DD6EE2A6D
          4B46DBC8E28B8B1C779CC86AAB79EF2E8046F0FAEB22279E28F2C003B1B7F492
          B69D75507DDA7B97510C042CB43E6B75A884F5B87A47D988AD1778D041223BEE
          C8ECEB00F2F7E0832168C55DE7D026E7B275584FE7D92C10B01A5C739828D4BE
          76FCC3281BB030B5D34E22071F2C32F3CCDEBB0BA091D9ADC2CB2E0BB70EC747
          9DA0DD3E2EDBA5294C548A0645C06A601AAEB6D5EE026DB346D9C01A6B88FCE6
          3761ED4000280A7BF8DD1E82B787E1E32DBDF389B6BD7590BDC97B77E18380D5
          803458CDA49DFE2F9CEC1E6503F3CD171E60FF71DC69B300A02E369D834DEB60
          D33BC473A9B60374B09DE0BDBBC81701ABC134876917AED6B648E62F6E532DFC
          E21722438688F48EF328170064EEF6DBC344A5EFBD176B0BAF6ADBA9294CEB80
          0641C06A101AACECC9F223B51DA7AD57E61BB0DB81A79F1E260D0580D4D8523B
          16B2AEBC32D6166CAE88E3B59DAA03EF54EFDD457C04AC06A0E16A7E09D32FAC
          99F98BDB2755871F2EB2C71ECCC20E207D369D835DD3C68C89B58547254CE7F0
          A6F7AE222E46C492D370B59D847504B3FF0ADF124B880C1FCE43EC00CAE5E38F
          457EFD6B91FBEE8BB585CF24AC6778BDF7AE221E0256493587DB80A76B3B30F3
          17B74FAAEC39AB430FE5592B00E575DD7561EEACCF3F8FB505FD3F5439B429DC
          3E44C910B04A48C3D59CDADDA06DEDCC5FDC9EB13AF34C666207D018DE7C5364
          E85091679F8DB58587B5FD4C07E30FBC7715D92260958C862B4B3E36EFCADC99
          BFF8669B899C7492C88001DEBB0900F9993A55E48F7F14F9D39FC2CFD91BAD6D
          5B1D901FF7DE5564878055221AAEF6D36E9864BDDC4DFFFE22279C20B2E596DE
          BB08007E9E79262CF9F56694E7D36D999DA13A289FEBBD9BC80601AB043458CD
          A8DD79DA76CDFCC5575D35DC129C3BFB0FC4002039F63C96FD0FE7F5D19E4FBF
          5CDBBE3A387FE1BDABA80F012B711AAE16D0EE166D2B66FAC233CC2072C82122
          7BED25D2A387F76E0240B1D8370C8F3842E4934F62BCFA33DAB6D601FA0DEFDD
          44ED085809D370656BD15CAB6DB64C5F78D14545860D13596A29EF5D0480E2FA
          E8A33067D6830FC678F58FB5EDA083F4BDDEBB89DA10B012D41CFEDD6C56F613
          B565F7F1924DBFB0CB2EFACAFAD27DFA78EF2600A4C1667F3FE514912F32BFAB
          672B511F2B61F6F766EFDD4475085889D133AC9F8459D9B37DE27C8E39C25237
          6BADE5BD8B00909ED75E0B0FC03FFF7C8C57BF4DC2ECEF13BD77139523602544
          C3D55CDADDA16D70A62F3C585FEE820B44060EF4DE450048D7575F891C7594C8
          8D37C678F5A7B56DAA8376B415A9912D025622345C2DA3DD5FB5CD97E90BDBDC
          56A79DC62D4100C8CA39E7843B02CD99DFD57B4BDB263A708FF2DE45748F8095
          003D453790307968B6337CFEF29722071FCC22CD0090B53BEF0CDFC4CEFEB9AC
          711226258DB65022B2C1C85A701AAEF69430C755AFCC5ED4A660F8FDEF45B6DA
          CA7BF700D423FB4F4890A59123C3543763C664FDCAB676A1CD9575B1F72EA273
          04AC826AF9A6E049DA8ECAF485679D55E39AE6B5EF7FDF7B1791070660A4A66C
          C7ECBBEF8A0C1922F2EF7FC778F553B41DC3370C8B898055407AA6D80351976A
          DB21D3175E70417D557DD9F9E76FD910E72412C3318B144D9820F2AB5F893CFC
          708C57B7B91077D7C17CB2F76EE29B085805D31C260DB5AFE4663B5F822D7973
          EEB922B3CCE2BD8B71310003F1707ED5CE1689B62576AEBE3AC6AB3FA26DCBA6
          3039290A828055207AE95A58BB3BB52D96E90B6FB38DC8C9278767AF8058187C
          81EED95D84534F1599362DEB57B67B903FD141FD35EF5D4440C02A081D9A56D3
          6E84B6D9337B51FB76A07D4B70FFFDBD77AF65271980816838BFD2F1F7BF8B0C
          1D2A326952D6AF6C4FD36FAE57FEC7BD771104AC42D0CBE286DADDAAAD6F662F
          6AF35AD93C2C1B6FECBD7B280A0660A4A6CCC7EC4B2F89ECBDB7C8071F64FDCA
          96DAB6D2C1FD1EEF5D6C74042C677AF9B0B912AED3D63BB317B519D96D66F6E5
          97AFA290125FC8504E1CB348DD871F8AECB38FC80B2F64FDCA53B46DDF14FEC7
          1D4E08588E7478D851BBCB25CB39AE165D54E4C20B45E699C77BF7FC310003F1
          707E65C36E13DA84A4F7DF9FF52BDB5C59BBEA207F8DF72E362A029613BD340D
          D1EE7C6D3D327BD135D71439FB6C919966F2DE3D343A065FA4C8EBB8B507DE6D
          C9327B003EE357D6B68F0EF417F9EC5863236039D053F840EDCE922CDFFF4D36
          09CF5CF5ECE9BD7B15BE090CC0480CC72C62B38065AB6C64CB0EDC8374B019EE
          BD7B8D868095333DD28F9630437B7636D8404F9DE1E984AB3262F005E26A9473
          ECFCF345860D8BF1CA36E3FBC9DEBBD7480858396A0ECB1A1C99E98BAEB38EC8
          9FFEC41C57686C8D32F8A23CBA3A66ED9A7ECE3931B67A6A53D6CBAFA15304AC
          1CB4AC2B68FF4B7240A62FBCFAEA6176769B92015D6300466A38661BDB196788
          5C1C652DE7B3B50D65FDC2F8085891358787D82FD0B667A62FBCF2CAE1DB8233
          CEE8BD8BF0C0E00BC4558473CC667CBFEAAA18AF6CC96DEFA6F0103C22216045
          D41CA65FB842B25EB4D9E6B7B2FFB3E9D7AF8B8D17E0E2009415E717F272FCF1
          2237DC10E3956D91E85D9AC2740E8880801549CB2757F6BF1ED986ABA5960ADF
          34E9DFDF7B17D1150660209E463ABF6C5F8F3D56E4B6DB62BCBA85AC9DF9242B
          0E0256042DCF5C5D2859DF165C6CB110AE6699C57B1781E26AA4C117E5D0DD31
          6BF3641D79A4C89D77C6D8BADD2EDC8B67B2B247C08AA039CC3792ED03ED0B2E
          2872C51522B3CDE6BD7BE96300466A38663175AAC8618789DC775F8C573FBB29
          CCCF880C11B03216652A86F9E613B9EC329139E6F0DE3D1411832F105751CEB1
          AFBE1239E82091871E8AF1EA4CE19031025686A24C223AF7DC22975F2E32D75C
          751456908B0350469C5FC8D3942922071C20F28F7FC478752623CD10012B232D
          CBDF643BFDAE7D6265E16AD020EFDD433D1880911A8ED9629B3C5964FFFD459E
          7C32C6AB0F65599D6C10B032D0B270B3CD7595DDFB39706078A07D8105BC770F
          F826065F20AE4ACEB1499344F6DB4FE4D96733DFBA8439B25820BA4E04AC3AE9
          91B8A376574A9896211BF62DC14B2E11596411EFDDABF14D610006A2E1FC42AB
          8913350AED2DF2C20B59BFB24DDBF0730D08D778EF62CA085875D0CBDC56DAD9
          0C70BD327BD1EF7C277C72B5C412DEBB871431F8027115ED1C1B374E648F3D44
          5E7B2DEB57B609487FA621E156EF5D4C1501AB467A8A6DA8DD086DBD337BD11E
          3D44CE3A4B64DD7523165EB08B0350269C5FF0F0EEBB223BEF2CF2E9A759BFF2
          146D9B6B50B8C77B175344C0AA815E4257D3EE7E6D7D337DE1A1434576DBCD7B
          F71013033052C3319B86A79F16D977DF309543B626695B4FC3C2E3DEBB981A02
          5695F452B3B076FFA76DF64C5F78B3CD444E38C17BF780EA30F8027155738ED9
          723A279E18A38A31DA7EA08121F3FB906546C0AA821EE6368DBAA5F8C5327DE1
          15561039FF7C91DED9DD6D2C0C0660201ECE2FB477FAE922D75E1BE395FFAD6D
          350D0D1F7BEF622A085815D2CB581FED6C8D82B5327D619B40F4CA2B59020771
          300023351CB3F5B1750B0F3C50E4F12877F41ED1B6810687C9DEBB9902025605
          5A166FBE5ADB0E99BEB07D63D096C0F19A8E810B1952C3310B746FC284F03CEF
          1B6FC47875FB786C271687EE1E01AB02CD61E9806CD768B26F0CDA47B9EBACE3
          BD7BE5C2000CC4C3F9958EB7DF0E21CBA671C8DE294D616938748180D50DBD9C
          EC293166B4DD73CF300B2F50160CBE405CD59E638F3E2A72C821B1CECD211A20
          2EF67E4B8A8C80D5053D2437D0EE4EC97222513378B0C879E7854FB11A090330
          100FE7173A326C98C835512664B7F9207ED2149E4D460708589DD04BD532DA3D
          A66D40A62F6CCBE0D8C1FEDDEF7AEF221A0D033052C3315B3F9B172BCE723AC6
          EE3FAEA1416294F76E161101AB037A4ACF2561AEABF9327DE1A6A63053FB1A6B
          78EF62073BCD850C89E198052A337AB4C8CF7F1E1E7ECFDE5B12E6C87ACF7B37
          8B8680D58E5EB2FB69F7B0B6C199BFB82D6570C001DEBBD8381880817838BFD2
          F2C00322471E19EBD59FD6B6B6068A89DEBB592404AC365AA663B845DB9699BF
          F8D24B8B5C708148AF6C1FE7020A89C117A9698463D6BEB97EF3CDB15EFD366D
          5B337DC37404AC369AC3540C2767FEC2FDFB87C9446D5251048D703143B970CC
          22755F7E19BEC1FE9FFFC4DAC2D11A2A4EF1DECDA22060B5D04BE78FB5BB4B5B
          F65FEDFBDDEF44D65DD77B171113832F1017E75836DE7A4B64F7DD45264D8AF1
          EAD3B46DACC1E25EEFDD2C0202967C1DAE16D0EE29096B0D666BA38D447EFB5B
          2E0E404C9C5F488DE7317BCB2D22679C11EBD56DADC295345CBCE1B783C5D0F0
          014B0FF119B5FB87B615337FF18103C3940C03B29DE901356000466A3866118B
          1D5BF685ABA79F8EB58567B4ADAE01E30BEF5DF544C012B94CBB5DA3BCB8DD1A
          5C7B6DEF5D441931F8027195FD1C7BEF3D915D768975ABD05CAE016337EFDDF4
          D4D0014B4F1F5BABE69C282FBEC10622C71FEFB87325BF38009E38BF5006B7DE
          1AF356A1D95F43C6B9DEBBE9A56103965E1E57D3EE416DBD337FF1596715B9FA
          6A919967F6DE4D7860F005E2E21CCB86BD8F4387C6BC553845DBBA1A341EF7DE
          550F0D19B0F4909A53C2C4687347D9C0C92777FDAD412E0E403C9C5F488DE731
          6BB70A77DD55E48B688F4B8DD63658C3C6077E3BE9A3E102567358B8F97E6D71
          1E8EFAD18F444E38C17B37D1150660A486631631D9AD425BC62D1E5B1D65BDA6
          B04074C368C480354CBB03A3BCB8DD12BCEAAAB0A0339017065F20AEB29F63AD
          B70A9F7D36E656866BE018EABDAB796AA880A587D076DA5D176D03871D26B2F9
          E6DEBBD9C18E97FCE20078E2FC426A3A3A66DF7823CCF23E756ACC2D6FAFA1E3
          7AEFDDCF4BC3042C3D9CE6D76EA4B6384F9E2FB658586BB047F613C123710CC0
          480DC76C633AFBEC3009693C9F695B5E83C79BDEBB9A878608587AA9E829E11B
          836B46DBC89FFF2CB2ECB23514C7850C89E19805E2F13CBFC68F17F9F9CF3506
          7D16732B8F4AF86661D48FCA8AA05102D631DA9D186D0336E7D531C778EF6671
          300003F1707E21A61123623FF06E8ED5F07192F7AEC656FA80A597A2EF6BF798
          846F0F66AF6F5F912BAF14997D76EF5D05187C81D8CA7E8ED9FEEDBDB7C86BAF
          C5DC8A7D9B700D0D20FFF4DEDD984A1DB0F4309949C29A488B44DB881D883BEE
          E8BDAB952BFBC501F0C4F985D47474CC3EF79CC84107C5DEF2ABDA56D41032C1
          FB2D88A5EC01EB12ED768FB68179E611B9EC32915E713E1C4309310023351CB3
          8DE9C413451E7C30F6562ED510B287F7AEC652DA80A597846DB5BB31EA464E39
          4564B5D5322C9A0B1912C3310BC4E5758E7DF8A1C8EEBB8B4C9E1C7B4B3FD520
          7293CF4EC655CA80A587E320ED9ED3366BB48DD83706870FF7DED5E2630006E2
          E1FC424C36F5D00D37C4DECA27DA96D330F28EF7EE66AD74014B2F373611D5DF
          B4FD30EA86CE3C5364F9E5BD7717E81C832F52C3315B2C365D834DDB306952EC
          2D3DA06D7D0D24D3BC77394B650C58876BF7FBA81B59714591D34FF7DED5FA71
          31436A386681783A3ABF2EBD54E4DA6BF3D8FA111A48FEE0FD1664A954014B0F
          8DC1DA3DAEAD77D40DD9ADC1A597F6DE5DB4C7E00BC4C539D6785A271FFDFCF3
          D85B9AA26D350D254F7BEF72564A13B0F4B4EF23614A8625A36E68A595447EF7
          3BEFDD058A87C11788CBEB1CBBE20A91ABAFCE634B2F4998BA21FA93F5792853
          C0B299DAE34FA7FEC73F8A2CB184F7EEA68901188887F30BB14C9C28B2CB2E22
          137299B2EA240D26C77AEF72164A11B0F4B2628B003EA56D86A81B5A75D53037
          08901A065FA488E3B638EC39ACCB2FCF634B5F6A5B49C3C9F3DEBB5CAFE40356
          CBB706EDB9ABEF47DFD839E7882C126F5278575CC8901A8E59209EF6E7977D93
          70B7DD44C68DCB63EBB684CE6AA97FABB00C016BA876D157A6FCFAD3AB134EF0
          DE5D548AC117888B73ACF15C775D5E9F62998334A00CF3DEE57A241DB0F4F45E
          40BB51DAFA45DF983DD8BEC20ADEBB0CA481C117A9E198ED9E7D7A65CF624D99
          92C7D6266A5B4643CA1BDEBB5DABD403D63DDAFD38FA86165840E4BCF3BC77B7
          5CB89821351CB340F8A2D75D77E5B5B57B35A46CE8BDCBB54A3660E9A54E63B4
          E4F359E5D0A1FA4F9CECBF31F2C0E00BC4C539560C6FBD25B2FFFE79FE7BECAA
          41E50AEFDDAE4592014BFF59E7D0EE456D03A36F6CC000912BAF14E95DE7DCA5
          5C1C807838BF909A948FD9DFFC46E4E9DCE6031DAB6D290D2B1F7AEF76B5520D
          58366FFFF6B96C6CFBEDC33D67A42DE58B191A13C72C8ACAC29585ACFC5CA761
          6507EFDDAE5672014B2F399B6A777B2E1BEBD52BACC334DB6CDEBB0D7C13832F
          100FE757D7ECFDF9C52F44DE7E3BCFAD6EA681E50EEF5DAF4652014BFF49FB4B
          B8353828970DAEBBAEC8618779EF766DB84000F1707EA1D1DD7DB7C89FFF9CE7
          16DF9170AB70BCF7AE572AB58075B676BFCA6D83679D25B2E8A2DEBB8DD430F8
          0271718EF9B3A91A76DF3D2C069D9F3F6A6839C07BD72B954CC0D2D36969ED46
          6AEB99CB06175A48E3DCD99176868B03100DE7175293EA317BD14522B7E7F3C4
          4E8BA9DA96D7E0F282F7AE5722A58075AF761BE4B6C1214344B6D8C27BB71143
          AA1733342E8E5914D16BAF891C7C70DE5BBDAF298FF92F339044C0D24BCB66DA
          8DC86D833D7B8A5C7699C8CC337BEF3AD03D065F202ECEB1CE1D7040981B2B5F
          9B37E5F565B73A143E60E9616D1350D97238F93D0CB5CA2A22C71EEBBDEBD9E1
          E200C4C3F985D46479CCDE7AABC815B9CF03FA1F09CBE8E4B2664FAD52085887
          6A775AAE1B3DE20891D557F7DE759401832F52C4718B4A8D1D2BB2D75E1EC7CC
          611A604EF7DEFDAE143A60B5CCD86E4975406E1B9D69A6707B70861972DA492E
          64480CC72C104F8AE7D76F7F2BF2DC73796F759CB6458B3CC37BD103D605DAED
          95EB4637DA4864DF7DBD773D5D295E1C8094708EA1681E7A4864F8708F2D5FA8
          21666FEFDDEF4C6103965E4256D0EE296D3D72DDF0EF7F2FB2D862DEBB0FD486
          C117888B73ECDB264F16D9630F912FBEC87BCBD3B4ADA441E659EFB7A023450E
          580F6AB74EAE1B9D6B2E9173CEF1DEF5B8B83800F1707E2135591DB37FFC63F8
          242B7F0F699059D763C3DD2964C0D27FEE6DB4BB29F70D6FB9250B3B232E0660
          A48663169578E20991D3F2FD3E5A1BDB6A98B9D9FB2D68AF70014B4FE53EDABD
          A46DC1DC377ED249224B2DE5B8F35CC890188E59209E94CE2FBB4D684BE77CF9
          A5C7D65FD7B6A4069AC9DE6F435B450C58476A774AEE1BB66F0F5E7AA9488F7C
          1FF92AB5942E0E408A38C75024279F2CF2ACDBE3504769A039D5FB2D68AB5001
          4B2F15032524D1FEB96F7CADB5440E3CD0FB2D00B2C3E08BD470CCA6ED9E7B44
          2EBED86BEBB6EAF4821A6AC67ABF0DAD8A16B07EA7DD112E1B1F3A5464CD35BD
          DF827C7131436A38668178EA3DBFC68C11F9C52F3CF7E0F71A6A7EED59405B85
          09582D938AFE575BBFDC376EB7052FB944B79CFFA69121065F202ECE3174E7F0
          C345DE7CD36BEB13B52D5494C9478B14B0CED4EE20978D2FB9A4C8F1C77BBF05
          40DA187C81785239BF6EB841E4965B3C2B384B83CDC1DE6F832944C0D2C3666E
          ED5ED336A34B013BEF2CB2F9E6DE6F43F9A572810052C4F9852278F55591638E
          F1ACC0663B5D58C3CD68EFB7A22801EB4FDAF9DDB83DE30C914183BCDF06201E
          065FA48663364DF6EF66CBCD8D1BE759C59F35DCFCD2FBAD700F58FA4F319F84
          059D7BBB14D0BFBFC8451779BF0DFEB89821351CB3403CF59C5FC38689FCF39F
          9ED54F91B010F45B9E451421605DA8DD10B702565E59E4D043BDDF06648DC117
          888B730C9DB9F34E91ABAEF2AEE2220D387B7916E01AB0F4F45C48BB57B4F572
          2B62A79D4436DDD4F36D00CA87C117A9E198CD8E3D8775DC71DE557CA56DF1A6
          303B810BEF8075B976BE8BFF9D7082C8A28BBA96D090B89821351CB34065A64E
          1519324464CA14EF4AAED090B3ABD7C6DD02965EAA16D7EE056D3DBD6A901966
          08B3CEF6F2FB000D25C1E00BC4C53996165BDBF7E597BDABD0A4274B37853B65
          B9F30C58D76AB7BDD7F6BFB6C41222BFF94D4E3BCCC5018886F30BA929FB316B
          F361DD7EBB7715E63A0D3A3B786CD82560E961B58C7623B5F9AEAC6C735F6DB7
          9D6B09C841D92F6428278E5BA4EC996744CE3CD3BB0A334DDBF21A7646E5BD61
          AF8075B5763B7A6CFB1B0E3B4C648515B890213D1CB3403C9C5FF59B385164FF
          FD8BF25E5EA36167A7BC379A7BC0D2B77A5E094FF5FB3EF8D4A4BB7EFEF922DF
          F98E6B195114E38006CA8B730CE8DE114788BCF79E7715C6BE51686B14BE9DE7
          463D02D6E9DA1D92F776BF65F6D945CE3ACBBB0A9411832F1017E7581ACE3947
          E48927BCAB687586069E5C27BDCC3560E929314042821C90E7763BB4DC72E116
          A1072E0E403C9C5F484D598FD91123BC177E6ECBD6EE99B729F4B9C83B60597A
          3C2DCF6D766AA38D4476F47F0C0C0ECA7A31437971CC22454F3E29F2A73F7957
          D1D6614DE12E5A2E720B58CDE1992B7BF66ADEBCB6D9A53DF6105977DD0E0AE5
          4286C470CC02F1707ED56EF46891A38FF6AEA22DBB8366CF627D95C7C6F20C58
          F604BFFBE244FF73CC318D33833B1708201ECE2FA426AF6376DA34917DF60933
          BB17C7CE4D612683E8F20C584F6BB7625EDBEBD69FFF2CD2AF9F7715283B065F
          A4866316593AF6589177DFF5AEA2AD6734F80CCE6343B9042C3D5D7FA4DDFD79
          6CAB2233CF2C327CB87715011733A486631688A76CE7D779E789FCEB5FDE55B4
          B79E869FBFC7DE485E01EB4EED36CE635B1559724991C30FF7AEA29CCA767100
          8A86730C29B16F12FEE52FDE55B47797869F9FC4DE48F480A59782A5B57B3E8F
          6D55EC473F12D97967EF2A80EC31F80271718E55C7BE49689F62158BFD232EAB
          A1E485981BC923605DACDD1EB1B753155B7F70C30DBDABF0C1C5018887F30BA9
          897DCCBEF9A6C8492779EF65472ED100B467CC0D440D58FACFF63DEDDED0D627
          E676AAB6F7DE22ABAEEA5D051A0D832F52C3318B7A7DFAA9DFA4DE5D9BAC6D01
          0D41EFC7DA40EC80F55BED8E8BB98D9AD8F3578B2FEE5DC5B77131436A386681
          78CA707ED9540DFBED57D47D39BE29E49428A2052C7D2B7B4AF8F46A50AC6DD4
          ECE49345E69CD3BB8AF22BE609059407E7185270C82122E3C77B57D19177247C
          8A1565A2AE98016B13EDEE88F5FA75F9E31F45669CD1BB0A202E065FA48663B6
          9C4E3C51A3CC3BDE557466530D427F8DF1C23103D66DDA6D11ED2DA9559F3E45
          5B1BC90F1733A48663168827D6F975F6D9222FBEE8BD779DF98B06A12D63BC70
          9480A5FF447369F79684F5078B658E398AFA8D06D48BC117888B730CB5B8FC72
          91C71FF7AEA233B62EE17C1A86DECBFA856305ACA3B43B39F6BB5293C5160BF7
          8301648BC1178827E5F3EBB6DB44EEB9C7BB8AAE1CAD61E894AC5F34F380D51C
          5EF3556D0BE5F1AE546D955544860CF1AEA2F1A47C710052C03986A27AE00191
          1B6EF0AEA22BFFD5B64853988034333102D6FADADD97D7BB52359BC5FD673FF3
          AE02C817832F52C3315B1E369BFB25977857D19D0D3410FD2DCB178C11B0AED7
          AEB80966A38D44B68CF23C5BDAB89821351CB3403C599E5FCF3D2772FEF9DE7B
          D49D1B34106D97E50B661AB0F49F6376EDDED5D63BCF77A52A9B6E2AB2C926DE
          552036065F202ECE3154EAA59752F8F6FE146DF368281A93D50B661DB0ECE9F1
          D3F37E57AAB2D556223FFE3117072026CE2FA48663369E575F151936CCBB8A4A
          1CAAA1E88CAC5E2CEB80A5315596C8FD2DA9863D7FB5EEBADE55808B1952C331
          0BD4C6167C3EED34EF2A2AF1B286A225B37AB1CC02965E7AD6D2EE6197B7A41A
          3BEE28B2C61ADE55A06C187C817838BFD2367AB4C8A9A77A5751A9B535183D92
          C50B6519B0AED0EEE76E6F49A576DD55E4FBDFCF7FBB5C20807838BF909A463A
          663FFA282C9793862B3518ED92C50B6512B0F430E9AB9DBE83D2CFF35DA9C89E
          7B8AACB8A27715C853235DC8500E1CB328934F3F15F9CD6FBCABA8D4446DDFD5
          7034A9DE17CA2A606DABDD8DDEEF4A45F6DD57649965DAED0017332486631688
          87F32B5B1335B31C75947715D5F8A986A39BEA7D91AC029685AB6DBDDF918AFC
          F297228B2FEE5D455C5C1C80B838C780CA4D992272D861DE5554E3260D473FAD
          F745EA0E58CDE1B6A0DD1EECEBFD8E54E417BF287FC0822F065F202ECEB1B44C
          9E2C72C411DE5554C36E0FDA6DC289F5BC4816016B7BEDAEF57E372AB6F7DEDF
          BE4598372E0E403C9C5F484DD98FD90913448E3DD6BB8A6AEDA001E9BA7A5E20
          8B8075AB76E9AC3DB3FBEE222BACE05D05BC94FD428672E2B845CAEC21F7E38F
          F7AEA25AB76940DAAA9E17A82B60E9293F40BB0FB5F5F17E272AB6F3CE22ABAC
          D2C54E712143623866817838BFEA67D334A4330F56ABC9DAE6D09034AED617A8
          3760695A912BBDDF85AAD84CEEABAFEE5D457EB8380071718E2135791FB3EFBD
          27727AB157D1EBC4CF35245D55EB7F5C6FC0BA5DBB4DBDDF81AAD85A846BAFED
          5D051A05832F52C3318BACBDF596C8F0E1DE55D4E20E0D499BD5FA1FD71CB0F4
          149C45BB0FB4F5F67E07AAB2A9E6C1F5D6F3AE623A2E66480DC72C104F19CFAF
          D75E1339F75CEF2A6A3145DB9C1A943EADE53FAE2760EDA6DDA5DE7B5FB50D37
          0C0D7194F1E2001409E71852F3CA2B22175EE85D45AD76D7A074592DFF613D01
          EB2EED36F2DEF3AAFDE847229B6CE25D051007832F100FE7576D468D12B9FC72
          EF2A6A75B706A58D6BF90F6B0A587A880DD4EE7D6DBDBCF7BC6A6BAE199EC36A
          445C1C80B838C7909A3C8ED9679E11B9369DE932DBF94ADBF7342C8DADF63FAC
          35600DD12ECDCFFB965B4E64974C16CA06AAC3E08BD470CC220B0F3F2C72C71D
          DE55D4632F0D4B1755FB1FD51AB046481D4FD6BB5A6081B01E61117131436A38
          668178CA727EDD79A7C8430F7957518FDB352C6D5EED7F5475C06A0EDF1AFC58
          C21A84E9996D3691238FF4AEA23194E5E2001415E7185270DD75E13661BA6C4D
          C2D99AC2B70A2B564BC05A5FBBFBBCF7B666BD7A899C728A7715407C0CBE480D
          C76C395D7491C8ABAF7A5751AF0D3430FDAD9AFFA09680758676077BEF695D6C
          4DA4BE7DBDABF0C7C50CA9E19805E289757E0D1B26F2C107DE7B57AF3335301D
          52CD7F504BC07A51BB25BDF7B42E076B3E9C734EEF2A9035065F201ECE2FD4EA
          C413453EFFDCBB8A7ABDA48169A96AFE83AA02969E5EF36BF786F75ED66DC810
          914516F1AE0228170660A4866336BEA953458E3DD6BB8AAC2CA0A1E9CD4AFF72
          B5016B5FED929CEFFE1B6CC1E7C183BDAB682C5CC8901A8E59A07E9F7E2AF287
          3F78579195FD34349D57E95FAE3660FD456AF8AA62E16CB491C83AEB785781D4
          310003F1707E95C3DB6F6B24A9389314DD080D4D5B54FA972B0E582DD333D84C
          A63379EF61DD56594564EBADE36E838B031017E718104F56E7D7C8912237DEE8
          BD375999A06D60A5D3355413B0D6932ABFA25858F3CF2FB2CF3EDE552026065F
          202ECE3154E2BEFB529F64B4BDF53538DD5FC95FAC26609DA6DDA1DE7B96099B
          A2E19863BCAB00CA8BC117A9E1988DE39A6B445E7AC9BB8A2C9DD1546116AA26
          608DD26E69EF3DCB8CCDE63E53FA773B93C4850C29E2B805AA6773608DAD7A9D
          E4227B4183D33295FCC58A02965E56E6932ABE9A98843DF610596821EF2A5016
          0CBE403C9C5F69FAEAAB300756F9FEFDE6D7F0F456777FA9D280B5B776E77BEF
          51A636DB4C64D555F3D956F90E2EA05838C7909A463866DF7F5FE4DCF46776EA
          C03E1A9E2EE8EE2F551AB0AED7EE67DE7B94290B579B6EEA5D05F2D008173294
          0BC72CCAE0B9E7446EBED9BB8A186ED0F0B45D777FA9D280F58E76F378EF51A6
          ECF6E0EEBBB7EC201733248663168887F32B1B7FFFBBC8C30F7B5711C3BB1A9E
          0675F797BA0D58A5591EA73D7BC0FDF0C3BDAB88838B031017E718D0BDEBAF2F
          DB3708DBEA76D99C4A02D68EDA5DEDBD27511C7618DF2444F6187C817838BFD2
          317C78582AA79C76D200754D577FA19280F567EDF6F7DE9328B6DB4E64A9AA16
          C7CE061708201ECE2FA4A68CC7ECF8F122679DE55D454CE76880FA45577FA192
          803552BBE5BCF7248A1FFC20AC4B88C651C60B19CA8D6316297AF145919B6EF2
          AE22A6E734402DDFD55FE83260E9693D40BB4FB4F5F0DE9328E69E5B64EFBDDB
          ED341733248663168887F3AB36F7DC23F2CF7F7A5711D3346DB36A881AD7D95F
          E82E606DA8DDDDDE7B114D0FCD8DBFFEB5C80C337857120F1707202ECE31A426
          8F63F6924B44468FF6DED3D836D210754F677FD85DC03A41BB63BDF720AA9FFF
          5C64C105BDAB405931F822351CB3A8D7975F8A9C769AC8B469DE95C476A286A8
          DF74F687DD052C5B31FA47DE7B10D5BAEB8AACBDB6DFF6B99821351CB3403C65
          38BFDE7C53E4AAABBCABC8C3DF3544ADD7D91F761AB0F49FB8A7769F69EBE7BD
          0751D984A33BEDE45D457994E1E2001415E71752F0D863220F3EE85D451E266A
          9B5983D4D48EFEB0AB80B592764F7A571F5DEFDE613EACA68A26B5078A8D0118
          8887F3AB3236C1E86BAF7957919795353D3CD5D11F7415B00ED06EB877E5B9D8
          638FF08DC2B2E3E200C4C53986D4647DCCDA7357C386894C9EECBD6779395083
          D4D91DFD415701AB7C0B3C7766ADB57C9FC3426360F0456A3866512D7BFEEA9A
          6BEA7F9D7474BAF0735701EB6DA96031C352986BAEF02996372E66480DC72C10
          4F8AE7D7FDF78BFCEB5FDE55E4E91D0D52F376F4071D062CFD279D4DBBB1DE55
          E7EA80035897306B295E1C8094708EA168CE3F5FE4934FBCABC8DB400D531FB7
          FFCDCE02D6BADA3DE05D71AE7EF21391E597AFFF7580A260F0456A3866D33676
          ACC845177957E1E1871AA61E6CFF9B9D05AC5F49270F6D95D6A28B8A6CBBAD77
          15F9E142861471DC02F1D47B7ED9D2388D313D437B076898FA63FBDFEC2C605D
          A8DD10EF8A7365CBE50C1D2AD2B3A77725A815832F100FE717BA73EDB5226FBF
          ED5D85878B344CEDD5FE373B0B58FFA7DDAADE15E7EEA73F0D138F02A81E0330
          52C3319B9D2FBE10F9D39F1AF53D7D42C3D40FDAFFE6B7025673F8BDF152F619
          DC3B3278B0C8061B7857514E8D79D221651CB340E55E7C51E4AF7FF5AEC28BCD
          E8DEBFE9EB08355D47016B61ED5EF5AED645FFFE22FBEECBACEEA80C0330100F
          E7575AFEF21791FFFCC7BB0A4F8B6872F8C6F4F51D05AC2DB5BBD5BB5237DB6D
          2732FFFCF5BF0E1707202ECE31209E6ACE2FBB3D78DE792253A756FEDF94CF56
          1AA86E6BFB1B1D05ACDF6877BC77A56E965A4A64934DBCAB40BD187C817838BF
          D0D6C891227FFB9B7715DE8ED3407542DBDFE82860DDA85D03CD57D08E7D9B70
          FFFD430FA0360CC0480DC76CEDECDB83EFBDE75D85B79B3450FDB4ED6F7414B0
          5ED16E31EF4A5D6DB491C832CB7857515E5CC8901A8E59A063366BFBA5977A57
          5104FFD640B578DBDFF846C0D24B485FED2668EBE15DA9AB79E715F95963AC73
          8D8C300003F1707E15D73FFE21F2C413DE5514C1346D3369A89AD4FA1BED03D6
          CADA35D42A8D9DDA6B2F910103B2792D2E0E405C9C63484D598ED94B2E111937
          CEBB8AA2584543D593ADBF681FB076D7EE12EF0A0B618D3544566DBCB9564BA9
          2C1732340E8E59A4E0DD77456EBCD1BB8A22D94343D5FFEE97B60F58A76B7788
          77858530CB2C1A3777F7AE02E8180330100FE75765EC9B832FBCE05D45919CA1
          A1EAD0D65FB40F58376BB7B5778585B1CD3622F3CDE75D45F5B8380071718EA1
          D14D9E2C72F1C5225F7EE95D4991DCA2A16A9BD65FB40F584F6BB7A2778585B1
          E082225B6CE15D0552C3E00BC4C3F9550C4F6B5C78F451EF2A8AE6190D55835B
          7FD13E607DACDDACDE1516CA6EBB85DB8559E1E200C4C53986D4A476CC5ABD97
          5F2E327EBC772545F38986AAD95A7FF1BF80A56FD7CCDA7DEA5D5DE12CBFBCC8
          BAEB7A5781ACA476210338665134AFBE2A72D75DDE5514D52C1AAC3EB31FDA06
          2C4D12F2AC7765856333BAEFB9A748EFDEDE95001D630006E2E1FCFAB69B6E12
          79FF7DEF2A8A6A050D5623ED87B601ABB11779EECA5A6B89AC98E8A3695C1C80
          B838C7909A7A8ED90F3E08010B9DF9DFA2CF6D03D650EDCEF2AEAC906CC2D15D
          76D177ABA9FED7426361F0456A3866D1957BEF15F9CF7FBCAB28B28334290CB3
          1FDA06ACE1DA1DE05D5961FDE427220B2F9CED6B7221438A386E81788A7C7E4D
          982072D55522D3A679575264676BB03AD07E681BB0FEA2DDE6DE9515D6DC738B
          6CCD1461DD2AF2C501481DE7173C3DFEB8C833CF785751742334587D3DBF53DB
          80F59C76CB7A5756683627D6A041DE55009D630006E269E4F36BD22491ABAF66
          62D1EE3DAFC16A39FBA16DC0B2D51AFB7B57566873CD95F6A7588D7C7100F2C0
          3986D4547ACCDAA75723477A579B82F11AAC06D80F5F072C7D7B076A37C6BBAA
          246CB699C8BCF37A57811431F822351CB3309F7F2E72CD35225F7DE55D492A66
          D77035B63560ADACDDBFBC2B4AC29C7386350A63E06286D470CC02F114E5FC7A
          EC319151A3BCAB48C92A1AAE9E6C0D58DB6A77A37745C9B06F14CE3FBF7715C5
          57948B0350469C5FC8C3C48922D75E2B3275AA772529F9A986AB9B5A03D6C1DA
          9DE15D5132669F5D23E9B6DE55005D6300466A38668BC716747EF145EF2A5273
          8886AB335B03D6A9DAFDDABBA2A46CB8A1C8820B7A57513B2E64480DC72C1057
          FB73CCE6BDBAFE7AE6BDAADEEF345C1DD91AB02ED46E887745491938904FB18A
          8601188887F3ABF13CF288C8CB2F7B5791A28B345CEDD51AB06C0DC22DBD2B4A
          CEBAEB8A2CB69877154031300023351CB39DFBE4134D06B7F2E9556D6E6B0A6B
          127E1DB034A6CA9ADE1525A76F5F91EDB613E9DDDBBB92E2E34286D470CCA291
          DD79A7C8E8D1DE55A4EA510D576BB5062C7B826D49EF8A92B4DC7222ABAEEA5D
          053C300003F1707EF979E30D91FBEFF7AE22652F6BB85AB235607DA8DD77BD2B
          4A528F1E615EAC5966F9E6EF737100E2E21C03B267D331DC745378C01DB5FA48
          C3D51C4DCD6136775B5CA8A77745C99A671E918D37F6AE026D31F802F1707E95
          D7B3CF8A3CFDB47715A9B349C37A5BC09A4D7F18EB5D4DF2D65F9FC94781560C
          C0480DC76C9854F4965B5812271B032D60D9D7E05EF1AE2479FDFB875B853DF9
          20B05B5CC8901A8E593482071F1479FD75EF2ACA62710B58ABEB0F8F7957520A
          83078BACB0827715F0C0000CC4C3F915DF071F88DC7597771565B28605ACCDF5
          87BF7857520AF6E9D5565B890C18F0CDDFE7E200C4C53986D414E998B5B9AE6E
          BF5DE4D34FBD2B29932D2C60EDA13F5CEC5D4969CC3967580C1AC551A40B1950
          098E59E4C91E6A7FFE79EF2ACA664F0B5887EB0FBFF7AEA4546C5EAC2599560C
          11310003F134D2F935766C9854B491F6391F4758C0FA83FE70987725A5D2AB97
          C8165B8407DF3D70A200F1707EA12CECD6E01D77706B308ED32C60D9EDC13DBC
          2B299DEF7D4F64C30DBDAB80070660201ECEAFEC3CF38CC8A851DE5594D52516
          B0AED61F76F4AEA4947EF00391C517FFE6EF717100E2E21C436A3C8E59BB3578
          F7DD9C2FF15C6301EB26FD611BEF4A4AC96E156EBEB9C84C33795782565C4C90
          1A8E5964CD6E0DDA7357DC1A8CE9660B5823F487CDBC2B292DBB55B8C106DE55
          A0CC18808178CA787E8D1CC9ADC1F86EB78075B7FEC0C34231ADB28AC8124BF8
          6CBB8C1707A02838BF909A8F3E12B9EF3E8EDDF8EEB180F577FDE187DE95945A
          8F1E221B6D2432DB6CDE95206F5CC4901A8ED9F29A3225DC1AFCFC73EF4A1AC1
          0316B01ED51FD6F0AEA4F46CCA069B80748619A6FF1E1732A4866316882BE639
          F6F0C322EFBEEBBD878DE2310B58FFD21F56F6AEA421CC3FBFC89A6B7A571117
          0330100FE7176AF5CA2B61C676E4E5490B5823F587E5BC2B6918DFFFBEC8228B
          785781B2620006E249F5FCFAF86391BFFD2D7C7B107979CE02D64BFA83D313D8
          0DC81684B60948679925FF6DA77A710052C13986A2F9F24B917BEE119930C1BB
          9246F3B205ACD7F48785BC2B69280306849065F364A17130F822351CB3E9FBC7
          3F44DE7EDBBB8A46F45F0B58EFE80FF37857D270165C30CCF4DE8A0B1952C471
          0BC453EFF9F5DA6B224F3DE5BD178DEA5D0B581FEA0FDFF5AEA421ADB492C8A2
          8B7A57110F832F100FE717BA32668CC8830FF2DC959F8F2C60D95CF9337B57D2
          909A9A44D65E3BCCF60E648D0118A9E198CD86CD73650FB54F9EEC5D4923FBCC
          0296CD38D6D7BB928665F362D9523A364F569EB89021351CB340F7BEFA4AE481
          075867D0DF240B58FAAF213DBD2B696816AED65FFF9B9390A27A0CC0403C9C5F
          6978FC7126132D86A904ACA298734E91B5D60AB70D811431002335653B665F7C
          51E4A597BCAB4030955B8445621390AEB8A277157194ED4286F2E398454ADE79
          47E48927BCABC0749378C8BD68060F16598869C992C0000CC4C3F955397BDEEA
          A18744A64EF5AE04D37DC6340D45D3A387C8EAAB875B86003AC6E00B04F68D41
          0B5793267957826FFA8889468BC896D359630D8DBDE4DE9A310003F1707E15C3
          175F883CFCB0C8C489DE95E0DBDE65A99CA2B265742C640D1CE85D09503D0660
          A426B563D6E6B87AE411D6182CAEFFB2D87391D9B40D6BAE2932EBACDE95642B
          B50B19C0318B22993245E4D14745C68DF3AE049DFB7AB1E791FAC372DE95A013
          16B26CFA8699F91E42A1310003F1707E4DF7E597228F3D26F2D967DE95A06BCF
          59C0FA97FEB0B27725E8429F3EE193ACBC677B0752C1008CD4D472CCDA2CED36
          91E8279F78578FEE3D6901EB51FD610DEF4AD08D19670C216BA699BC2B490F83
          2F52C3318BF66C0A060B571F7FEC5D092AF39805ACBFEB0F3FF4AE0415E8DB37
          84ACEF7CC7BB1278630006E229DAF965E1EA9FFF141933C6BB1254EE010B5877
          EB0F1B7A57820A59B8B290D5B78BC9F78B767100CA84F30B799A362D84AB8F3E
          F2AE04D5B9C702D608FD6133EF4A50857EFD42C8B267B3503C0CC0403C8D747E
          D9BE3EF9A4C8071F785782EADD6E01EB26FD611BEF4A50257BE0DD667CEFDDDB
          BB12A0581A690046397474CCDAEF3DFDB4C8FBEF7B5787DADC6C01EB6AFD6147
          EF4A5083010342C8B2A91C5019065FA48663B6F1D8BFF9B3CF8A8C1EED5D096A
          778D05AC8BF5873DBC2B418D6C7EACD5560B33BFA331310003F1789C5FCF3D27
          F2CE3BDE7B8EFA5C6201EB0FFAC361DE95A00E36D3FBAAAB761CB2187C817838
          BF90B551A344DE7ACBBB0AD4EF340B5887EB0FBFF7AE0475B2350B575E994FB2
          8A860118A9E198F5F3E28B226FBEE95D05B27184052CBB3D78B17725C8803D93
          6521CB2625056260F005B267F35CD96D411E682F933D2D606DAE3FFCC5BB1264
          C4A66EB090E5B576210330100FE757F9D8C2CD4F3DC5DA82E5B38505ACD5F587
          C7BC2B41867AF614597E799139E7F4AE04796300466A1AF9981D3F3E4CC5F0C5
          17DE95207B6B58C05A4C7F78C5BB1264ACA94964F1C545165C70FAEF35F2850C
          69E2984559D9B237234786059C51468B5BC09A4D7F18EB5D092299775E91A596
          0A81AB8C1880817838BFE278FB6D91975FE6FD2DB78116B06CE4FD525B4FEF6A
          10897DC3708515F88621B2C5E00054C7CE99575E611A86F29BAAADF7D71F6BE8
          3FF987DA7DD7BB224464EB17AEB452D78B44678D01188887F32B2DF64DC1E79F
          67D1E6C6F09186AB395A03D68BDA2DE95D1122B3750BED93AC5966F1AE047960
          00466ACA7ACC4E9E1C96BEB187DAD1085ED670B5646BC07A44BB35BD2B420E7A
          F410596619BE6188F49475F045B959A8B27065210B8DE2510D576BB506AC5BB5
          DBD2BB22E468E18545165AC8BB8A6C310003F1707E55CF6E07BEF042B83D8846
          729B86ABAD5A03D685DA0DF1AE08399B6B2E9125970C9F6A01F56200466A621E
          B3F620FB6BAF715E34A68B345CEDD51AB04ED5EED7DE15C1813D8F659392CE30
          43DCED7091416A3866518BD66F0A8E1EED5D09FCFC4EC3D591AD01EB60EDCEF0
          AE084EEC9B85F6F0FB77BEE35D495A18808178523CBF6CD250BB25F8F1C7DE95
          C0D7211AAECE6C0D58DB6A77A377457064CBEB2CBAA8C8DC737B5702742FC5C1
          17E5F6E9A7222FBEC8C3EC303FD57075536BC05A59BB7F79578402987DF6F05C
          56EC5B86B1310003F1707E4D376D9AC8EBAF8BBCF30EEF0B5AADA2E1EAC9D680
          3550BB31DE15A1206CBEAC25960833C003B560A0416A6A3966274E0C4BDE4C98
          E05D3D8A65760D5763FFB7409D1E5AE3B4EBEF5D150A649E79C2740E3D335E45
          89C117A9E198457BEFBE2BF2DFFF864FB080E9C66BB01A603FB40D58CF69B7AC
          776528187BF0DD6E19F6277B7789011888A748E7D79429E15B829F7CE25D098A
          E9790D56CBD90F6D03D65FB4DBDCBB321450931E260B2C2032EFBCE167A0488A
          34F8A2DCC68C11F9F7BFC3B705818E8DD051720BFBA16DC01AAEDD01DE95A1C0
          669E393C9B35E38CDE9554870118A9E1982D169B89DD260DFDE003EF4A507C67
          6BB03AD07E681BB0866A7796776528387B1E6B914558CBD013832F1057DB736C
          DCB8F0A9D5175F785785341CA4C16A98FDD03660D95A84B77A578644D8740E36
          6F56AF5EDE9500F922E03606FB77B6E56E987E01D5B135086FB31FDA06ACE5B5
          7BD6BB3224C4A673586C31915967F5AEA458B81803F1E4717E4D9A143EB562FA
          05546F050D5623ED87B6016B66ED3EF5AE0C09B2D9DFED2178168D8637C22DEA
          F5FEFB61E250A65F406D66D160F599FDF08DAF84E9A5C91650E2E30854CFA673
          B04FB3669AC9BB92AE310023351CB3F9B0E917EC4176A65F40ED3ED150355BEB
          2FDA07ACA7B55BD1BB4224EC7BDF13996FBEF497DA4905832F501FFBA46AF4E8
          3071A87D5B10A8DD331AAA06B7FEA27DC0BA59BBADBD2B44E2EC9B863667D65C
          73316F16CA8D809BB68F3F1679F34DBE2188ACDCA223DE36ADBF681FB04ED7EE
          10EF0A51127DFB8667B31AF921780660A4A6118ED9CF3F1779E38D300503909D
          3334541DDAFA8BF6016B77ED2EF1AE102563016BFEF943E042DA1A61F04579D9
          0CEC6FBF2DF2E1871CCB88610F0D5597B6FEA27DC05A59BB7F79578812B25B85
          F67CD6A041D92F1E0D340A42416DEC7DB359D8ED392B96B9413CABE848F764EB
          2FDA072CFB88C126FEE0FBF688C31E7EB7E7B3E698C3BB92726200466A621FB3
          9F7D16260CB5B9AD80786C5E8F993454FDEF40FBD613C87AA8BFA2DD62DE95A2
          E46C5A077B3EAB7F7FEF4A50640446D4CA1E5CB7DB814CBB807CFC5B03D5E26D
          7FA3A38075A376DB7A578A0631DB6C615A873E7D6AFBEF19808178523CBF6CAA
          85F7DE0B1386A6583F52759306AA9FB6FD8D8E02D66FB43BDEBB5234109B01DE
          9ECFB219E1990D3E1D0C5E289A3163C2DA815F7EE95D091ACF711AA84E68FB1B
          1D052C167D860F5BDBD01E821F38D0BB12A0F808B8D3D99A81763B70E244EF4A
          D0B8FEB7C873AB8E02D6C2DABDEA5D291A982DB733CF3C220306785792360660
          A4A6DA63D61E5CB7DB813C67057F8B68A07AADED6F7414B0ECF7C66BEBE75D2D
          1A9C3D086FB3C137F244A5988EC08856F6499505ABCF3EF3AE0430F6D169FFA6
          AF23D4741DAE63A27FE3FFB45BD5BB62E06B33CE189ED1B25B875D2DBDC3000C
          C45384F3CB665EB787D7ED9620501C4FE8C8F483F6BFD959C0BA50BB21DE1503
          DF607368CD39A7C877BFCBC3F0455384C117E564C7D6A79F8660C55C5628A68B
          344CEDD5FE373B0B58BFD2EE6CEF8A810ED94CF03651A905AD5EBDBCAB415911
          1A7DD9FB3F766C58D666F264EF6A80AE1CA061EA8FED7FB3B380B5AE760F7857
          0C74C93EC5B2DB86F6A9967D03314F0CBE401CD3A685E9162C5831DD02D2F043
          0D530FB6FFCDCE02D66CDA8DF5AE18A8883D97650FC25BD0B2E7B5507E04DCF2
          B135023FFA28842B9B2C1448C7401D853E6EFF9B9D3E31AC97AFB7B51BE45D35
          509599670E41CBBE8108208E2C03EE942921587DFC71F8F40A48CB3B1AA4E6ED
          E80FBA0A58D76BF733EFCA819AD85C5AF69C167369F9E0132674C7D60AB4DB80
          F6003BC70BD2758306A9ED3AFA83AE02D601DA0DF7AE1CA84BDFBE2168D9275B
          5D4DF100748500901D9BC3CA3EB1B2291780F41DD8D4C99702BB0A582B69F7A4
          77E54026EC9B87B3CC121697CEFAF621832FD035BB0D68B3AD5BB39F81F25859
          83D4531DFD4157014B4724B1697299D11DE5D2A74F7828DE9ACDAD85B411708B
          C99EA7B299D62D54B14620CAC90EEC99354875F8AD8C2EEF99E865EB7EED7EE4
          BD074034F6AC96052D7B568BC94B51142987469B65DD9EABB25B803CB48E72FB
          BB86A8F53AFBC3EE02D609DA1DEBBD07407416AEEC392D0B5BFD0AFEA16DCA83
          2FCAC92602B550658DB9ABD0384ED410F59BCEFEB0BB80B5A176777BEF01902B
          9BB4D49ED7B296F704A6283E026E607355D92D400B552C6183C6B49186A87B3A
          FBC3EE02967DC7FD136DDC3B4163B24FB32C68D9A75B95DE4264004659D9B1DD
          7A0B70FC788E753432BBFF3DAB86A84EBF0EDBEDF7D6F5F419A9DD72DE7B02B8
          B27065CF6959D82AFA2DC446C6801F87CD59659F5659B319D7013CA7016AF9AE
          FE422501EBCFDAEDEFBD274061D8370FED132D7B40DEE6D9627E2DC4E4151AED
          B92AFBB4CA1E56B78005A0AD73F4CAFF8BAEFE4225016B47EDAEF6DE13A090EC
          932D0B5AADAD57AF7CB7CF2736C88A7DE3CFA653B050653D0FAB035DD94903D4
          355DFD854A02D6FCDABDE1BD2740126C8EADD6B0C5A75BE5977AC06DFD94CA02
          953DA89EFAFE00F95940AFEE6F76F5172ABAFAEB29F78E76F378EF0D9014FB74
          CB9ED76A6D4C6A0A6FED3FA5E2792AA016EF6A781AD4DD5FAA3460B1F033502F
          FB74CB8256CA9F6EF109477ADA7E4A65CF52F16F08D4ABD3059EDBAA3460EDAD
          DDF9DE7B0494867DBA656B22F2E916AA514938B2F9A93EFF3C042AEBF9940AC8
          DA3E1A9E2EE8EE2F551AB0E6936EEE3502A8834D68DA1AB6669C312C4E5D2D3E
          99684CF6EF6E9F4CD93354ADCF520188697E0D4F6F75F7972ABE47A1A7F028ED
          96F6DE2BA021D8275A764BD1C2566B5F4BE84A1DA1F19BEC192ABBE5D7DA2C58
          4D99E25D15D0485ED0E0B44C257FB19A80759A76877AEF19D0B06C0A88D6C0D5
          C8A1AB51B40D5316A4AC274C01DECE68AA300B5513B06CC5E8BF79EF1980362C
          74797DD2C5A74BD969FFC914610A28AAF53538DD5FC95FAC2660D9AAB763B5CD
          E4BD7700BAD01ABADAB6BC274045E7085340AA26681BA8C1A9A213B6AAEF896B
          C8FA8B769B7BEF21802AD9A75AAD41CB9EEFB2BE6D43B6EC9B7CF6ED3D6B3623
          7AEBCF16A498211D48D5080D4D5B54FA97AB0D58FB6A77AEF71E02C890CDC765
          01AC356C7514C06C5A096F45B9256975B406A6CE5A516A0590A5FDF46A795EA5
          7FB9DA80C5B2394023B280D53E74B50D62657AD8BEEDA74F1D35FB73008DA8DB
          E571DAAA7A2A690D592F6AB7A4F75E022810FB14CC429835FBB9F5D7AD3F77F7
          EB4AFE6E2BFB74C89E63B2BEB575F5EB6AFEAE85273E7D02F06D2FE99568A96A
          FE835A02D619DA1DECBDA7001A8C052DC20F001F67EA15E8906AFE835A02D6FA
          DADDE7BDA700000039D9A0A9CAA9AA6A0958365DC3C7DAFA79EF2D0000406413
          B5CD56E9F40CADAA0E584643D608ED36F3DE63000080C86E6FAA618AAA5A03D6
          10ED2EF4DE63000080C8F6D2B07451B5FF51AD016BA076EF6B63864200005056
          5F69FB5E5358C9A62A35052CA321EB2EED36F2DE7300008048EED6A0B4712DFF
          613D016B37ED2EF5DE730000804876D7A074592DFF613D016B16ED3E90F0AD42
          00008032B16F0DCEA941E9D35AFEE39A0396D19075BB769B7ABF0300000019BB
          A3A98E1913EA0D583B6B77A5F73B00000090B19F6B48BAAAD6FFB8DE803540BB
          0FB5F5F17E17000000323259DB1C1A92C6D5FA0275052CA321EB56EDB6F47E27
          00000032729B06A4ADEA79812C02D6F6DA5DEBFD4E0000006464070D48D7D5F3
          0259042C5B93F0236D7DBDDF0D0000803A4DD2F6DDA6B00661CDEA0E584643D6
          8DDA6DEBFD8E000000D4E9260D473FADF745B20A5816AE6EF47E47000000EAF4
          530D4737D5FB2259052CBB3D68B709FB79BF2B00000035B2DB82767B7052BD2F
          9449C0321AB2AED0EEE79EEF0A0000401DAED460B44B162F9465C05A4BBB87DD
          DE12000080FAACADC1E8912C5E28B380653464BDA4DD122E6F09000040ED5ED6
          50B464562F9675C03A44BBD3737F4B000000EA73A886A233B27AB1AC03D6ECDA
          BDABAD77DEEF0A0000408DA6689B4743D198AC5E30D3806534645DAFDDCFF27C
          57000000EA708306A2EDB27CC118016B7DEDEECBED2D010000A8CF061A88FE96
          E50BC60858F69AAF6A5B28AF77050000A046FFD5B648D3D711263B99072CA315
          1EA5DDC979BC2B00000075385AC3D02959BF68AC803597766F69EB15FB5D0100
          00A8D157DAE6D330F45ED62F1C2560190D59B769B745CC77050000A00E7FD120
          B4658C178E19B036D1EE8E686F090000407D36D520F4D7182F1C3360F5D4EE0D
          6D83626D030000A046EF685B4083D0D4182F1E2D60190D59BFD5EEB898DB0000
          00A8C1F14D21A744113B607D4FC2A7587D626E070000A00A93257C7AF57EAC0D
          440D584643D6C5DAED117B3B00000015BA4403D09E31379047C05A5ABBE7F3D8
          16000040376C42D1653594BC107323B9841EDD933BB5DB388F6D01000074E12E
          0D3F3F89BD91BC02D68FB4BB3F8F6D01000074613D0D3F7F8FBD91DC6EDB69C8
          7A5ABB15F3DA1E0000403BCF68F0199CC786F20C583B6977555EDB0300006867
          670D3E57E7B1A13C0396AD4B682B56CF9BD7360100005ABCAD6DA1A6B0FE6074
          B97EB34F43D6A1DA9D96E736010000D4611A7A4ECF6B637907AC011212E4803C
          B70B00001ADA386DF336853E17B9CF4DD51CD2E321796F17000034AC339AC25D
          B4DC78042C7B06CB9EC5EA95F7B6010040C3B167AEECD9ABB7F3DCA8CBECEACD
          E109FE1D3DB60D00001ACA354D6126835C7905AC65B41BA9AD87C7F601004043
          98A66D790D3BA3F2DEB0DBFA801AB2AED56E7BAFED030080D2BB4E83CE0E1E1B
          F60C588B4B5868B1A7570D0000A0B4A66A5B5A83CE2B1E1B770B584643D6E5DA
          EDE25903000028A52B34E4ECEAB571EF80B5908464C9370A01004056EC9B838B
          3785590B5CB8062CA321EB42ED8678D70100004AE3220D387B7916508480359F
          76FFD1D6DBBB16000090BC29DA16D580F3966711EE01CB68C8FA9376BFF0AE03
          000024EFCF1A6E7EE95D445102D6DCDABDA66D46EF5A000040B2BED0B6B0869B
          D1DE85142260190D59676A7790771D000020596769B039D8BB0853A480358784
          A7FDFB79D7020000923351C29A831F7A17620A13B08C86ACDF697784771D0000
          2039BFD750F36BEF225A152D600DD4EE756DFDBD6B010000C918AF6D410D3563
          BD0B6955A8806534641DA9DD29DE75000080641CA581E654EF22DA2A62C0EAA3
          DD4BDA16F4AE050000149EDDF95A5203CD64EF42DA2A5CC0321AB2B6D1EE26EF
          3A000040E16DAB61E666EF22DA2B64C0321AB21ED46E1DEF3A000040613DA441
          665DEF223A52E480B582764F69EBE15D0B0000289C69DA56D220F3AC77211D29
          6CC0321AB22E10E7C51A010040215DA821666FEF223A53F48065938FDA42D003
          BC6B01000085314EC282CE859854B423850E584643D6A1DA9DE65D070000288C
          C334C09CEE5D4457520858BDB51BA56D51EF5A0000803BBBB3B58C069829DE85
          74A5F001CB68C8DA4CBB11DE75000000779B6B78B9DDBB88EE2411B08C86AC7B
          B5DBC0BB0E0000E0E63E0D2E3FF62EA2122905ACA5B51BA9ADA7772D00002077
          53B52DAFC1E505EF422A914CC0321AB2CED6EE57DE75000080DCFD5143CB01DE
          45542AB580D55FBB17B50DF2AE050000E4E61D6D4B696819EF5D48A5920A5846
          43D6A692C0C36D000020339B6960B9C3BB886A2417B08C86AC6BB5DBDEBB0E00
          0010DD751A5676F02EA25AA9062C9BE1DD6E150EF4AE050000443356C2ADC1C2
          CED8DE99240396D190B58B76977BD7010000A2D95583CA15DE45D422D9806534
          64DD2389CC87010000AA72AF86940DBD8BA855EA016B0109CBE8F4F3AE050000
          6466A284E570DEF02EA45649072CA3216BA8766779D7010000327390069461DE
          45D4A30C01AB87768F6BFBBE772D0000A06EFFD4B69A069469DE85D423F98065
          34642DABDD53DA66F0AE050000D4EC4B6D2B693879DEBB907A952260190D5927
          6A778C771D0000A06627693039D6BB882C942960F5D1EE196D4B7AD7020000AA
          F692B61535984CF62E240BA509584643D66009CF63F5F6AE050000546C8A84E7
          AE9EF62E242BA50A584643D6E1DAFDDEBB0E000050B1233490FCC1BB882C9531
          60D9B70AFFA6ED87DEB50000806E3DA06DFDD4BF35D85EE90296D1903548BBE7
          B4CDEA5D0B0000E8D427DA96D330F28E7721592B65C0321AB2B6D5EE46EF3A00
          0040A77EAA41E426EF2262286DC0321AB22ED16E77EF3A0000C0B75CAA21640F
          EF2262297BC09A49C2D40D8B78D7020000FEE7550953324CF02E249652072CD3
          1C96D0794C5B2FEF5A0000807CA56D8DA6B0244E69953E6099E630C3FB89DE75
          0000003956C3C749DE45C4D62801ABA7760F6A5BD3BB1600001AD8A3DAD6D5F0
          31D5BB90D81A2260190D59F36B3752DBCCDEB50000D0803ED3B6BC068F37BD0B
          C943C3042CA3216B3BEDAEF3AE03008006B4BD868EEBBD8BC84B43052CA3216B
          9876077AD70100400319AE8163A87711796AC48065DF26BC5FDBDADEB50000D0
          001ED6B65E53F8F660C368B880653464CD2961C5EEB9BD6B0100A0C4466B1BAC
          61E303EF42F2D69001CB68C85A4DC2370B7B7BD7020040094D91F08DC1C7BD0B
          F1D0B001CB68C8DA4FBB73BCEB0000A084F6D79071AE77115E1A3A60190D5997
          69B7AB771D000094C8E51A3076F32EC213014B6446EDFEA16D45EF5A00002801
          5B0378750D185F7817E2A9E10396D190B580764F699BCDBB16000012F6B1B695
          345CBCE15D883702560B0D593FD6EE2E6D3DBC6B01002041D3B46DACC1E25EEF
          428A8080D58686ACA3B43BD9BB0E00001274B4868A53BC8B280A02561BCDE1FD
          B845DB96DEB500009090DBB46DDDF4F5500A43C06A478F8C7E12669D1DEC5D0B
          000009B089BBD7D64031D1BB90222160754043D65CDAFD9FB6F9BC6B0100A0C0
          DED2F6030D13EF7917523404AC4E68C85A46BBC7B40DF0AE050080021AA76D0D
          0D12A3BC0B292202561734646DA0DD9D121688060000812DDCFC130D11F77917
          525404AC6E68C8DA53BB8BBCEB0000A040866880B8D8BB8822236055A0394CDD
          7094771D000014C0291A1E8EF62EA2E80858156899BEE16A6D3B78D7020080A3
          6BB5EDC4740CDD236055488FA43E12EE35AFE55D0B00000E1ED1B6810687C9DE
          85A480805585E6B056E1E3DA16F3AE0500801CFD5BDB6A4D61AD415480805525
          0D590B4B98236B76EF5A0000C8C11809735DBDE65D484A085835D090B59A76F7
          6BEBEB5D0B0000114DD2B65E53B87B832A10B06AA4216B43ED4668EBED5D0B00
          00114CD1B6B906857BBC0B491101AB0E1AB2B6D2EE066122520040B9D844A23F
          D39070AB7721A92260D54943D68EDA5DA9AD87772D000064609AB69F6B40B8C6
          BB909411B032A0216B88761708EF2700206D36BFD5DE4DAC605237024146F488
          3C50BB61DE7500005087A11A0C867B17510604AC0C3587A5034EF2AE0300801A
          1CD31496864306085819D390758A76477AD7010040154E6D62CDDD4C11B02268
          0E1FAF1EE05D0700001538BB293CE6820C11B02268591CFA426D7B7AD7020040
          172ED6B6178B37678F8015497398B6E12A6D3B78D702004007AED5B673539896
          0119236045D41C2620BD420859008062B170B54B539850141110B0226BF924CB
          E6C8E2762100A008ECB6E0DE7C721517012B072DCF64D91C593CF80E00F074B6
          84B9AE78E62A3202568E98C20100E088A9187244C0CA19939102001C308968CE
          08580E5A96D5394B78FF010071D9ADC08358FE267F0CF04E5A16883E5FC243F0
          000064CD1E62DF87859B7D10B01C69C8DA51BBCB254CE7000040566CFA855D75
          90BFC6BB904645C072A6216B2BEDAED3D6DBBB160040294CD1B6BD0EF0B77A17
          D2C8085805A0216B430927425FEF5A0000499BA46D2B1DDCEFF12EA4D111B00A
          4243D66ADA8DD036BB772D0080248DD1B6B90EEC8F7B17020256A168C85A58BB
          3BB52DE65D0B002029FFD6F6131DD45FF32E040101AB603464CDA6DD6DDAD6F2
          AE0500908447B46DA903FAC7DE85603A02560169C8EAA3DDA5C222D10080AED9
          A2CDBBEB603ED9BB107C1301ABA05AD62FB419DF59D60000D0115B7EED18D615
          2C260256C1E959B3A776E70973650100029BE36A5F1DC02FF62E049D23602540
          43D606DADDA46D80772D000057E3B46DAB83F77DDE85A06B04AC4468C85A46BB
          BF6A9BCFBB1600808BB7B46DA203F728EF42D03D0256423464CDA5DD1DDA067B
          D70200C8D5D3DA36D541FB3DEF4250190256623464F5D3EE2A6D5B7AD70200C8
          854DDDB3B30ED813BD0B41E50858096AF986E191DA4ED4D6C3BB1E004014D3B4
          1DABED54BE29981E0256C2F46CFBB184395066F3AE050090299B3474071DA4EF
          F52E04B52160254E43D602DADDA26D45EF5A0000997846DBD63A40BFE15D086A
          47C02A010D59334A982B6B57EF5A000075B95CC21C575F781782FA10B04A4483
          D67EDA0DD3D6DBBB16004055A6681BAA83F2B9DE85201B04AC92D190B59A8449
          49E7F6AE05005091D112260F7DDCBB1064878055421AB2E6D4EE066D6B7BD702
          00E8D2C3DA7EA683F107DE85205B04AC926A0E6B179EAEED40EF5A00001D1AAE
          EDD0A6B0B6204A868055721AB4B6D3EE7C6D337BD70200F8DA67DAF6D101F87A
          EF42100F01AB0168C89A5FC2ECEF6B7AD702000DEE5109B3B2BFE95D08E22260
          35080D593D25CCFE7E9C84DB870080FCD86DC0E325CCCA3ED5BB18C447C06A30
          1AB4BEAFDDD5DA16F1AE05001AC4ABDA76D201F79FDE85203F04AC06A4216B26
          EDCED6B6BB772D005072976A3B4007DB09DE85205F04AC06A6416B5BED2ED036
          AB772D0050329F68DBBB29CC4B880644C06A701AB206697785B61F7AD7020025
          F180B65D74807DC7BB10F82160C142560FED0ED576A2B0CC0E00D4CA96BB3956
          DBE93AB84EF32E06BE0858F81F0D5A83254CE7B0A4772D00909897244CBFF0B4
          772128060216BE4143561FED8ED17684B619BCEB018082FB52DBEFB59DA403EA
          64EF62501C042C744883D6B2DA5D24615A0700C0B7D9B40B4374207DDEBB1014
          0F010B9D6A7936EB006D2769EBE75D0F0014C444099FF49FCDB356E80C010BDD
          D2A0B58084F50C7FEC5D0B0038BB57C23A826F781782622360A1621AB476D1EE
          4C6D03BD6B01809C8DD576705398D606E816010B55D190358776C3B56DEF5D0B
          00E4E43A6D07EA80F9A177214807010B35D1A0B5A976E74A98A81400CAC8260A
          DD4F07CA3BBC0B417A0858A89986ACFEDA9DAC6D7F6D3DBDEB01808C4CD5768E
          B6A375901CEF5D0CD244C042DD34682DADDD59DA36F0AE0500EA749FB6837470
          7CC1BB10A48D8085CC68D0DA4CBB33B42DEA5D0B0054E93FDA0ED141F176EF42
          500E042C64AA39AC65687367D97A5C03BCEB01806E8C93B00EABCD6935C5BB18
          9407010B51B47CDBD02628DD53C284A50050243641E8C5DA8EE1DB8188818085
          A83468ADA0DD306DEB78D702002D1ED2365407C067BD0B417911B0900B0D5ADB
          68779AB605BD6B01D0B05ED776980E7C377B1782F2236021371AB2FA6877B0B6
          23254CF1000079B0A9164ED576A60E7A93BD8B416320602177CD61A99DC3B4FD
          5258441A403CB628F39FB49DD61496BA017243C0829B9607E17FAD6D3F6D337A
          D703A034BE90B0D2C4EF78801D5E085870A7416B6EED8ED2B69784691E00A016
          36CDC285DA4ED1C16DB47731686C042C148606ADF924CC9FB59BB65EDEF50048
          C657DA2ED376A20E6A6F7917031802160A4783D642DA1DA76D27618D43009DB3
          3503AFD676BC0E66FFF52E06688B8085C2D2A0B5B876BFD5F63361B25200D3D9
          24A13768FBAD0E62AF78170374848085C2D3A0B58C84A91D2C6871EB10685C76
          2BD082D5A93A788DF22E06E80A010BC9D0A035AF76074A78189E750E81C661EB
          05DAC3EBC375D07ADBBB18A012042C24A73984ABBD252C2A3DAF773D00A2B130
          75B6B60B9A42C8029241C042B29AC3EDC2EDB41DA26D45EF7A0064E6196D6768
          BBBE29DC16049243C0422968D8FA9176876ADB4838AE8114E9692C776B3B5D4F
          E0BF7B1703D48B8108A5A257E8A525AC7768533CF4F1AE0740B76C6D409B6AC1
          D6097CC1BB18202B042C949206ADEF69B7AFB63DB50DF2AE07C0B7BCA3ED626D
          E7E940F4BE773140D6085828B5E63051A9DD36B46F1E6E224CF30078B2E7A9FE
          2AE11B81773785894281522260A16168D89A4BBBDD257CAAB590773D4003B159
          D6EDD3AA4B75D079CFBB18200F042C349CE670DCAF27E153AD2D8505A681186C
          E1E5DB247C5A757F5378881D6818042C3434BDE2CFAEDDAEDA86685BC2BB1EA0
          045ED67691B6CB758019E35D0CE0858005B4D0B0B596844FB5B6D6D6CFBB1E20
          2113B5DDA2ED421D541EF12E0628020216D08E06ADBE121E88DFAEA5EFEB5D13
          504093243CB07EBDF54DE1D7005A10B0802E34874FB2369310B63616E6D64263
          B339ABEE9210AA6E6F0A9F5C01E800010BA850CB1A889B4B085B3F161E8E4763
          B087D5EF9510AA46B026205019021650030D5BB348F806A285ADF585F9B5502E
          365FD5FFB77737BD35455118C75735511222B446041513A1622634F11D7C5262
          64C004256682C644B484915242E225A19ED5B56FCEA1A993D4BD5DE7E5FF4B56
          766E275D49D3739EECBDEFDEB72D42D50DBD283E663704740D010BF84F0A5BB3
          1AAE59CC6EF99D886C904717F9729FDF017853755D2F87F7D90D015D46C002C6
          6823960DAF5AECD7F23A9BDD13F00FCF2DF65479DD9D8AE540006340C0022648
          81EBA45561CB67B70E64F78441FB62314BB519AAF4027895DD10D057042C6097
          94D92D3F6BCBC396DF8F782EBB270CC2B2EA9645A8BAC72C15B03B0858401205
          AE131641CBAFED59541DCBEE09BDF056B5A4BA6371A1F2EBEC8680212260012D
          519613176BB5A0DA93DD175AED97EA99EABE45A85A62D90F68070216D052E5DC
          ADCB5605AE4BC6371487CEBFE9F7C84A98523DE45C2AA09D0858404728704D6B
          B86855E0BAA23A9EDD1726EA8DEA815581EAB11EDA3FB39B02D08C8005749842
          D7110D172C961347E37963A6AB6B7C66CA97FA9EAA9E8C463DA03F6437066067
          085840CF6CC4FFF569FB3374F978C6D8D395CDF74CBDB05A882AE3CBA9CD3F1D
          80BE20600103A1B7F77E8BA32116CA385FEA94EA70767F3DB3AE5A55AD94F2A3
          123C482DEBA1FB35BB39009347C002E0E1EB9045D09ADF663C98DD63CB7CB62A
          406D19F560FD94DD20805C042C008DCA7D8BA3B0E5E7771D55CDD56AB68CBE27
          6C3ABBDF1DF2CDE3BEE769CDE21EBEB55ABDB3384F6A55B5C23D7D009A10B000
          8C4DD9FFE5CB8D73DB9407B17DAA198B93EDEB35D3F0796FF9353FFEAAEF0D9F
          473FFB665B8353BDD6D90705605C7E03B79AD96F5E331F130000000049454E44
          AE426082}
        Scaled = True
        BeforePrint = iSaldoCaixaBeforePrint
      end
    end
  end
end
