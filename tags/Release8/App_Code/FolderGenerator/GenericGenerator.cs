using System;
using System.Data;
using System.Configuration;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Collections.Generic;

/// <summary>
/// Summary description for GenericGenerator
/// </summary>
public abstract class GenericGenerator
{
    private static float LINE_HEIGHT = 10;
    private static float CHAR_WIDTH = 1;
    private PdfPTable overflowTable;
    private Font overflowTextFont = null;
    private Font overflowHeadingFont = null;
    private List<DocumentType> docTypes = null;
	public GenericGenerator()
	{
        overflowTextFont = FontFactory.GetFont("Arial", 9);
        overflowHeadingFont = FontFactory.GetFont("Arial", 10, Font.BOLD);
	}

    public void Generate(Document doc, DocumentType docType,PdfWriter writer)
    {
        GenerateDocument(doc, docType, writer);
        if (overflowTable != null)
        {
            doc.Add(overflowTable);
        }
        writer.getI
    }

    protected DocumentType GetDocumentType(String name)
    {
        foreach (DocumentType docType in docTypes)
        {
            if (docType.Name.Equals(name))
            {
                return docType;
            }
        }
        return null;
    }

    protected abstract void GenerateDocument(Document doc, DocumentType docType,PdfWriter writer);
    public void SetData(DocumentType docType,List<DocumentType> docTypes)
    {
        this.docTypes = docTypes;
        SetDocumentData(docType);
    }

    protected abstract void SetDocumentData(DocumentType docType);

    protected void AddOverflowText(Document doc, PdfPTable table, string text,string itemNumber)
    {
        if (text != null && text.Length > 0)
        {
            int numOfLines = int.Parse(Math.Floor(table.DefaultCell.FixedHeight / LINE_HEIGHT).ToString());
            int numOfChars = int.Parse(Math.Floor((table.WidthPercentage * table.DefaultCell.Colspan) / (table.NumberOfColumns * CHAR_WIDTH)).ToString());
            string actualText = GetActualText(numOfLines, numOfChars, text);
            table.AddCell(new Phrase(actualText, overflowTextFont));
            if (actualText.Length < text.Length)
            {
                string overFlowText = text.Substring(actualText.Length, text.Length - actualText.Length);
                if (overflowTable == null)
                {
                    overflowTable = new PdfPTable(1);
                    overflowTable.WidthPercentage = 100;
                }
                PdfPCell cell = new PdfPCell();
                cell.AddElement(new Phrase("Continued from Item Number " + itemNumber + " overleaf:", overflowHeadingFont));
                cell.AddElement(new Phrase(overFlowText, overflowTextFont));
                overflowTable.AddCell(cell);
            }
        }
        else
        {
            table.AddCell("");
        }
    }

    private string GetActualText(int numOfLines,int numOfChars,string text)
    {
        StringBuilder actualText = new StringBuilder();
        int currentNumOfLines = 0;
        char[] seperator = new char[1];
        seperator[0] = '\n';
        string[] textLines = text.Split(seperator);
        foreach (string textLine in textLines)
        {
            string currentTextLine = textLine;
            while (currentTextLine.Length > 0)
            {
                int currentLength = int.Parse(Math.Min(numOfChars, currentTextLine.Length).ToString());
                actualText.Append(currentTextLine.Substring(0, currentLength));                
                currentTextLine = currentTextLine.Substring(currentLength, currentTextLine.Length - currentLength);
                if (currentTextLine.Length == 0)
                {
                    actualText.Append("\n");
                }
                currentNumOfLines++;
                if (currentNumOfLines == numOfLines)
                {
                    return actualText.ToString();
                }
            }
        }
        return actualText.ToString();
    }
}
