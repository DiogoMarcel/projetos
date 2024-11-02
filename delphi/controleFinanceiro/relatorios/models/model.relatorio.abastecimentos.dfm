object dmAbastecimentos: TdmAbastecimentos
  Height = 97
  Width = 640
  object qAbastecimentos: TFDQuery
    Connection = dmConexaoDB.FDConexao
    UpdateOptions.AssignedValues = [uvEInsert, uvCheckReadOnly]
    UpdateOptions.CheckReadOnly = False
    SQL.Strings = (
      'SELECT SQLUN.IDABASTECIMENTO'
      #9',SQLUN.OBSERVACAO'
      #9',CAST(CASE '
      #9#9#9'WHEN ORIGEMDADO = 1'
      
        #9#9#9#9'THEN CAST(TRIM(TO_CHAR(SQLUN.DATAABASTECIMENTO, '#39'TMMonth'#39')) ' +
        '|| '#39' / '#39' || TRIM(TO_CHAR(SQLUN.DATAABASTECIMENTO, '#39'YYYY'#39')) AS VA' +
        'RCHAR(30))'
      
        #9#9#9'ELSE CAST(TO_CHAR(SQLUN.DATAABASTECIMENTO, '#39'DD-MM-YYYY'#39') AS V' +
        'ARCHAR(30))'
      #9#9#9'END AS VARCHAR(30)) AS DATAABASTECIMENTO'
      #9',SQLUN.TOTALABASTECIMENTO'
      #9',SQLUN.DIFTOTALABASTECIMENTO'
      #9',SQLUN.KMCARRO'
      #9',SQLUN.DIFKMCARRO'
      #9',SQLUN.QUANTIDADELITROS'
      #9',SQLUN.DIFQUANTIDADELITROS'
      #9',SQLUN.MEDIA'
      #9',SQLUN.VALORLITRO'
      #9',SQLUN.ANO'
      #9',SQLUN.MES'
      #9',SQLUN.ORIGEMDADO'
      'FROM ('
      #9'SELECT A1.IDABASTECIMENTO'
      #9#9',A1.OBSERVACAO'
      #9#9',A1.DATAABASTECIMENTO'
      #9#9',A1.TOTALABASTECIMENTO'
      
        #9#9',CAST(A1.TOTALABASTECIMENTO - A2.TOTALABASTECIMENTO AS NUMERIC' +
        '(18, 4)) AS DIFTOTALABASTECIMENTO'
      #9#9',A1.KMCARRO'
      #9#9',CAST(A1.KMCARRO - A2.KMCARRO AS NUMERIC(18, 4)) AS DIFKMCARRO'
      #9#9',A1.QUANTIDADELITROS'
      
        #9#9',CAST(A1.QUANTIDADELITROS - A2.QUANTIDADELITROS AS NUMERIC(18,' +
        ' 4)) AS DIFQUANTIDADELITROS'
      
        #9#9',CAST(((A1.KMCARRO - A2.KMCARRO) / A1.QUANTIDADELITROS) AS NUM' +
        'ERIC(18, 4)) AS MEDIA'
      
        #9#9',CAST(A1.TOTALABASTECIMENTO / A1.QUANTIDADELITROS AS NUMERIC(1' +
        '8, 4)) AS VALORLITRO'
      #9#9',CAST(EXTRACT(YEAR FROM A1.DATAABASTECIMENTO) AS INTEGER) ANO'
      #9#9',CAST(EXTRACT(MONTH FROM A1.DATAABASTECIMENTO) AS INTEGER) MES'
      #9#9',CAST(0 AS SMALLINT) ORIGEMDADO'
      #9'FROM ('
      #9#9'SELECT *'
      #9#9#9',ROW_NUMBER() OVER ('
      #9#9#9#9'ORDER BY 1'
      #9#9#9#9') AS SERIAL_NUMBER'
      #9#9'FROM ('
      #9#9#9'SELECT IDABASTECIMENTO'
      #9#9#9#9',OBSERVACAO'
      #9#9#9#9',DATAABASTECIMENTO'
      #9#9#9#9',TOTALABASTECIMENTO'
      #9#9#9#9',KMCARRO'
      #9#9#9#9',QUANTIDADELITROS'
      #9#9#9'FROM ABASTECIMENTOS'
      #9#9#9'ORDER BY IDABASTECIMENTO'
      #9#9#9') SQ'
      #9#9') A1'
      #9'LEFT JOIN ('
      #9#9'SELECT *'
      #9#9#9',('
      #9#9#9#9'ROW_NUMBER() OVER ('
      #9#9#9#9#9'ORDER BY 1'
      #9#9#9#9#9') + 1'
      #9#9#9#9') AS SERIAL_NUMBER'
      #9#9'FROM ('
      #9#9#9'SELECT IDABASTECIMENTO'
      #9#9#9#9',OBSERVACAO'
      #9#9#9#9',DATAABASTECIMENTO'
      #9#9#9#9',TOTALABASTECIMENTO'
      #9#9#9#9',KMCARRO'
      #9#9#9#9',QUANTIDADELITROS'
      #9#9#9'FROM ABASTECIMENTOS'
      #9#9#9'ORDER BY IDABASTECIMENTO'
      #9#9#9') SQ'
      #9#9') A2 ON A1.SERIAL_NUMBER = A2.SERIAL_NUMBER'
      #9
      #9'UNION ALL'
      #9
      #9'SELECT CAST(0 AS BIGINT) IDABASTECIMENTO'
      #9#9',CAST('#39' - Totais mensal'#39' AS VARCHAR(80)) OBSERVACAO'
      
        #9#9',CAST(TO_DATE(EXTRACT(YEAR FROM DATAABASTECIMENTO) || '#39'-'#39' || E' +
        'XTRACT(MONTH FROM DATAABASTECIMENTO) || '#39'-01'#39', '#39'YYYY-MM-DD'#39') AS ' +
        'DATE) DATAABASTECIMENTO'
      #9#9',SUM(TOTALABASTECIMENTO) AS TOTALABASTECIMENTO'
      #9#9',CAST(NULL AS NUMERIC(18, 4)) DIFTOTALABASTECIMENTO'
      #9#9',CAST(NULL AS INTEGER) KMCARRO'
      #9#9',CAST(NULL AS NUMERIC(18, 4)) DIFKMCARRO'
      #9#9',SUM(QUANTIDADELITROS) AS QUANTIDADELITROS'
      #9#9',CAST(NULL AS NUMERIC(18, 4)) DIFQUANTIDADELITROS'
      #9#9',CAST(NULL AS NUMERIC(18, 4)) MEDIA'
      #9#9',CAST(NULL AS NUMERIC(18, 4)) VALORLITRO'
      #9#9',CAST(EXTRACT(YEAR FROM DATAABASTECIMENTO) AS INTEGER) ANO'
      #9#9',CAST(EXTRACT(MONTH FROM DATAABASTECIMENTO) AS INTEGER) MES'
      #9#9',CAST(1 AS SMALLINT) ORIGEMDADO'
      #9'FROM ABASTECIMENTOS'
      #9'GROUP BY EXTRACT(YEAR FROM DATAABASTECIMENTO)'
      #9#9',EXTRACT(MONTH FROM DATAABASTECIMENTO)'
      #9'ORDER BY ANO DESC'
      #9#9',MES DESC'
      #9#9',IDABASTECIMENTO DESC'
      #9') SQLUN')
    Left = 64
    Top = 16
  end
  object dspAbastecimentos: TDataSetProvider
    DataSet = qAbastecimentos
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 208
    Top = 16
  end
  object dsAbastecimentos: TDataSource
    DataSet = cdsAbastecimentos
    Left = 528
    Top = 16
  end
  object cdsAbastecimentos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'idabastecimento'
        DataType = ftLargeint
      end
      item
        Name = 'observacao'
        DataType = ftWideString
        Size = 1024
      end
      item
        Name = 'dataabastecimento'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'totalabastecimento'
        DataType = ftFloat
      end
      item
        Name = 'diftotalabastecimento'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'kmcarro'
        DataType = ftInteger
      end
      item
        Name = 'difkmcarro'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'quantidadelitros'
        DataType = ftFloat
      end
      item
        Name = 'difquantidadelitros'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'media'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'valorlitro'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'ano'
        DataType = ftInteger
      end
      item
        Name = 'mes'
        DataType = ftInteger
      end
      item
        Name = 'origemdado'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspAbastecimentos'
    StoreDefs = True
    Left = 368
    Top = 16
    object cdsAbastecimentosidabastecimento: TLargeintField
      FieldName = 'idabastecimento'
    end
    object cdsAbastecimentosobservacao: TWideStringField
      FieldName = 'observacao'
      FixedChar = True
      Size = 1024
    end
    object cdsAbastecimentosdataabastecimento: TWideStringField
      FieldName = 'dataabastecimento'
      Size = 30
    end
    object cdsAbastecimentostotalabastecimento: TFloatField
      FieldName = 'totalabastecimento'
    end
    object cdsAbastecimentosdiftotalabastecimento: TBCDField
      FieldName = 'diftotalabastecimento'
      Precision = 18
    end
    object cdsAbastecimentoskmcarro: TIntegerField
      FieldName = 'kmcarro'
    end
    object cdsAbastecimentosdifkmcarro: TBCDField
      FieldName = 'difkmcarro'
      Precision = 18
    end
    object cdsAbastecimentosquantidadelitros: TFloatField
      FieldName = 'quantidadelitros'
    end
    object cdsAbastecimentosdifquantidadelitros: TBCDField
      FieldName = 'difquantidadelitros'
      Precision = 18
    end
    object cdsAbastecimentosmedia: TBCDField
      FieldName = 'media'
      Precision = 18
    end
    object cdsAbastecimentosvalorlitro: TBCDField
      FieldName = 'valorlitro'
      Precision = 18
    end
    object cdsAbastecimentosano: TIntegerField
      FieldName = 'ano'
    end
    object cdsAbastecimentosmes: TIntegerField
      FieldName = 'mes'
    end
    object cdsAbastecimentosorigemdado: TSmallintField
      FieldName = 'origemdado'
    end
  end
end
