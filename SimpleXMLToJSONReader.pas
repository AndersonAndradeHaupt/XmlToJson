unit SimpleXMLToJSONReader;

interface

uses
  System.SysUtils, System.JSON, System.Classes, Xml.XMLIntf, Xml.XMLDoc;

type
  ISimpleXMLToJSONReader = interface
    ['{FDFCCF58-9479-4B1C-8A74-5D0D6BC5964B}']
    function ConvertXMLToJSON(const AXML: string): string;
    function ConvertXMLFileToJSON(const AFileName: string): string;
  end;

  TSimpleXMLToJSONReader = class(TInterfacedObject, ISimpleXMLToJSONReader)
  private
    function XMLNodeToJSONObject(Node: IXMLNode): TJSONObject;
    function XMLNodeToJSONArray(Node: IXMLNode): TJSONArray;
  public
    function ConvertXMLToJSON(const AXML: string): string;
    function ConvertXMLFileToJSON(const AFileName: string): string;

    Class function New:ISimpleXMLToJSONReader;
  end;

implementation

function TSimpleXMLToJSONReader.XMLNodeToJSONObject(Node: IXMLNode): TJSONObject;
var
  ChildNode: IXMLNode;
  JSONPair: TJSONPair;
  JSONObject: TJSONObject;
  JSONArray: TJSONArray;
  I: Integer;
begin
  JSONObject := TJSONObject.Create;
  try
    for I := 0 to Node.ChildNodes.Count - 1 do
    begin
      ChildNode := Node.ChildNodes[I];

      if ChildNode.IsTextElement then
      begin
        JSONPair := TJSONPair.Create(ChildNode.NodeName, TJSONString.Create(ChildNode.Text));
        JSONObject.AddPair(JSONPair);
      end
      else if ChildNode.HasChildNodes then
      begin
        if ChildNode.ChildNodes.Count = 1 then
        begin
          JSONPair := TJSONPair.Create(ChildNode.NodeName, XMLNodeToJSONObject(ChildNode));
          JSONObject.AddPair(JSONPair);
        end
        else
        begin
          JSONArray := XMLNodeToJSONArray(ChildNode);
          JSONObject.AddPair(ChildNode.NodeName, JSONArray);
        end;
      end;
    end;
    Result := JSONObject;
  except
    JSONObject.Free;
    raise;
  end;
end;

function TSimpleXMLToJSONReader.XMLNodeToJSONArray(Node: IXMLNode): TJSONArray;
var
  ChildNode: IXMLNode;
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  I: Integer;
begin
  JSONArray := TJSONArray.Create;
  try
    for I := 0 to Node.ChildNodes.Count - 1 do
    begin
      ChildNode := Node.ChildNodes[I];
      JSONObject := XMLNodeToJSONObject(ChildNode);
      JSONArray.Add(JSONObject);
    end;
    Result := JSONArray;
  except
    JSONArray.Free;
    raise;
  end;
end;

function TSimpleXMLToJSONReader.ConvertXMLToJSON(const AXML: string): string;
var
  XMLDoc: IXMLDocument;
  RootNode: IXMLNode;
  JSONObject: TJSONObject;
begin
  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.LoadFromXML(AXML);
  XMLDoc.Active := True;

  RootNode := XMLDoc.DocumentElement;
  JSONObject := XMLNodeToJSONObject(RootNode);
  try
    Result := JSONObject.ToJSON;
  finally
    JSONObject.Free;
  end;
end;

class function TSimpleXMLToJSONReader.New: ISimpleXMLToJSONReader;
begin
  result :=  TSimpleXMLToJSONReader.Create;
end;

function TSimpleXMLToJSONReader.ConvertXMLFileToJSON(const AFileName: string): string;
var
  XMLDoc: IXMLDocument;
  RootNode: IXMLNode;
  JSONObject: TJSONObject;
begin
  XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.LoadFromFile(AFileName);
    XMLDoc.Active := True;

    RootNode := XMLDoc.DocumentElement;
    JSONObject := XMLNodeToJSONObject(RootNode);
    try
      Result := JSONObject.ToJSON;
    finally
      JSONObject.Free;
    end;
  except
    on E: Exception do
      raise Exception.CreateFmt('Erro ao carregar o arquivo XML: %s', [E.Message]);
  end;
end;

end.

