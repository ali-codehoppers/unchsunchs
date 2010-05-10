using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Reflection;
using System.IO;

using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for FolderGenerator
/// </summary>
/// 

public class FolderGenerator
{
    
    List<DocumentType> docTypes = null;
    public string fileName = "";
    Document doc = null;
    PdfWriter writer = null;
	public FolderGenerator(List<DocumentType> docTypes)
	{
        this.docTypes = docTypes;
	}

    private Document GetDocument(DocumentType docType)
    {
        if (doc == null)
        {
            if(docType.IsLandScape == true)
                doc = new Document(PageSize.A4.Rotate());
            else
                doc = new Document();

            string filePath = System.Configuration.ConfigurationManager.AppSettings[WebConstants.Configuration.PHYSICAL_PATH];
            filePath += @"\Folders\";
            Random random = new Random();
            fileName = random.Next(1, int.MaxValue).ToString();
            fileName += ".pdf";
            filePath += fileName;
            writer = PdfWriter.GetInstance(doc, new FileStream(filePath, FileMode.Create));
            // Open the document
            doc.Open();
        }
        return doc;
    }

    public bool Generate() 
    {
        if (docTypes == null || docTypes.Count == 0)
        {
            return false;
        }
        
        bool isGenerated = false;
        try
        {
            // We create a writer that listens to the document
            bool doAddPage = false;
            foreach (DocumentType docType in docTypes)
            {
                if (docType.IsLandScape)
                    GetDocument(docType).SetPageSize(PageSize.A4.Rotate());
                else
                    GetDocument(docType).SetPageSize(PageSize.A4);

                if (doAddPage == true)
                {
                    doc.NewPage();
                }
                if (docType.GeneratorClass != null && docType.GeneratorClass.Length > 0)
                {
                    Type genaratorClass = Type.GetType(docType.GeneratorClass);
                    
                    object[] arguments = new object[3];
                    arguments[0] = GetDocument(docType);
                    arguments[1] = docType;
                    arguments[2] = writer;
                    
                    object[] setDataArgs = new object[2];
                    setDataArgs[0] = docType;
                    setDataArgs[1] = docTypes;

                    if (docType.Type.Equals("int"))
                    {
                        object generatorObject = Activator.CreateInstance(genaratorClass);
                        genaratorClass.InvokeMember("SetData", BindingFlags.InvokeMethod, null, generatorObject, setDataArgs);
                        for (int i = 0; i < docType.Number; i++)
                        {
                            if (doAddPage == true)
                            {
                                GetDocument(docType).NewPage();
                            }
                            genaratorClass.InvokeMember("Generate", BindingFlags.InvokeMethod, null, generatorObject, arguments);
                            doAddPage = true;
                            if (docType.IncludeBlankPage)
                            {
                                Font blankFont = FontFactory.GetFont("Arial",7,Color.WHITE);
                                GetDocument(docType).NewPage();
                                GetDocument(docType).Add(new Paragraph("[Blank Page]",blankFont));
                            }
                        }
                    }
                    else if (docType.Type.Equals("detail"))
                    {
                        foreach (int docId in docType.DocList.Keys)
                        {
                            object generatorObject = Activator.CreateInstance(genaratorClass);
                            docType.DocId = docId;
                            if (doAddPage == true)
                            {
                                GetDocument(docType).NewPage();
                            }
                            genaratorClass.InvokeMember("SetData", BindingFlags.InvokeMethod, null, generatorObject, setDataArgs);
                            genaratorClass.InvokeMember("Generate", BindingFlags.InvokeMethod, null, generatorObject, arguments);
                            doAddPage = true;
                        }
                    }
                    else
                    {
                        object generatorObject = Activator.CreateInstance(genaratorClass);
                        genaratorClass.InvokeMember("SetData", BindingFlags.InvokeMethod, null, generatorObject, setDataArgs);
                        genaratorClass.InvokeMember("Generate", BindingFlags.InvokeMethod, null, generatorObject, arguments);
                        doAddPage = true;
                    }
                }
            }
            isGenerated = true;
        }
        catch (Exception ex)
        {
            isGenerated = false;
        }
        finally
        {
            if (doc != null) { try { doc.Close(); } catch (IOException ex) { } }
        }
        return isGenerated;
    }
}
