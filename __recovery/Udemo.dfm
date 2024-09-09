object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 674
  ClientWidth = 905
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object mxml: TMemo
    Left = 0
    Top = 0
    Width = 905
    Height = 217
    Align = alTop
    Lines.Strings = (
      '<xmlcep>'
      '<cep>78552-442</cep>'
      '<logradouro>Rua dos Angelins</logradouro>'
      '<complemento>at'#233' 189/190</complemento>'
      '<unidade/>'
      '<bairro>Jardim das Oliveiras</bairro>'
      '<localidade>Sinop</localidade>'
      '<uf>MT</uf>'
      '<estado>Mato Grosso</estado>'
      '<regiao>Centro-Oeste</regiao>'
      '<ibge>5107909</ibge>'
      '<gia/>'
      '<ddd>66</ddd>'
      '<siafi>8985</siafi>'
      '</xmlcep>')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 312
    Top = 264
    Width = 161
    Height = 57
    Caption = 'Converter'
    TabOrder = 1
    OnClick = Button1Click
  end
  object mjson: TMemo
    Left = 0
    Top = 368
    Width = 905
    Height = 306
    Align = alBottom
    TabOrder = 2
  end
end
