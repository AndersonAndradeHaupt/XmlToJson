# SimpleXMLToJSONReader

Uma interface e implementação simples em Delphi para converter documentos XML em JSON. Este projeto fornece uma classe que pode carregar um XML de uma string ou de um arquivo e converter sua estrutura em um objeto JSON.

## Objetivo

O objetivo deste projeto é facilitar a conversão de XML para JSON no Delphi, permitindo que os desenvolvedores manipulem dados XML de forma mais fácil e os integrem com sistemas que utilizam JSON.

## Funcionalidades

- Converte XML em JSON a partir de uma string XML.
- Converte XML em JSON a partir de um arquivo XML.
- Lida com elementos de texto, arrays, e objetos no XML.

## Requisitos

- Delphi XE ou superior
- Biblioteca `Xml.XMLDoc` e `Xml.XMLIntf` para manipulação de XML

## Instalação

1. Clone o repositório:

    ```bash
    git clone https://github.com/AndersonAndradeHaupt/XmlToJson.git
    ```

2. Abra o projeto no Delphi.

## Utilização

### Convertendo uma String XML para JSON

Você pode utilizar a classe `TSimpleXMLToJSONReader` para converter uma string XML em JSON:

```delphi
var
  JSONResult: string;
begin
  JSONResult := TSimpleXMLToJSONReader.New.ConvertXMLToJSON('<root><element>Value</element></root>');
  showmessage(JSONResult); // Output em formato JSON
end;
