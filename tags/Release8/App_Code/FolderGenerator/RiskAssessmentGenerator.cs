using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;

using iTextSharp.text;
using iTextSharp.text.pdf;
/// <summary>
/// Summary description for RiskAssessmentGenerator
/// </summary>
public class RiskAssessmentGenerator : GenericGenerator
{
    string employer;
    string siteAddress;
    string assessorName;
    string deptSerial;
    string docSerial;
    string relatedRiskAssessments;
    
    List<string> sectionHeadings;
    int headingCount;
    List<string> sectionTexts;
    int textCount;
    string reviewDate;
    protected override void SetDocumentData(DocumentType docType)
    {
        Department.DepartmentSelectCommandRow department = DatabaseUtility.GetDepartment(docType.DeptId);
        if (department != null)
        {
            employer = department.co_name_long;
            deptSerial = department.co_name_short;
        }
        SetRelatedRiskAssesssments(docType);

        DepartmentOrder.DepartmentOrderRowRow departmentOrder = DatabaseUtility.GetDepartmentOrder(docType.DeptOrderId);
        if (departmentOrder != null)
        {
            if(departmentOrder.Isaddress_fullNull() == false) siteAddress = departmentOrder.address_full;
            if (departmentOrder.Isdate_order_reviewNull() == false) reviewDate = departmentOrder.date_order_review.ToShortDateString();
        }
        SetAssessor(docType);
        SetSectionData(docType);
    }
    private void SetSectionData(DocumentType docType)
    {        
        string currentSection = "";
        string text = "";
        DepartmentOrderDocTableAdapters.DocumentItemEntityTableAdapter ta = new DepartmentOrderDocTableAdapters.DocumentItemEntityTableAdapter();
        IEnumerator iEnum = ta.GetItemsByDocId(docType.DeptId,docType.CoId,docType.DocId).GetEnumerator();
        if (iEnum.MoveNext())
        {
            DepartmentOrderDoc.DocumentItemEntityRow documentItem = (DepartmentOrderDoc.DocumentItemEntityRow)iEnum.Current;
            currentSection = documentItem.section_desc;
            text = documentItem.item_name;
        }
        while (iEnum.MoveNext())
        {            
            DepartmentOrderDoc.DocumentItemEntityRow documentItem = (DepartmentOrderDoc.DocumentItemEntityRow)iEnum.Current;
            if (documentItem.section_desc.Equals(currentSection) == true)
            {
                text += "\n" + documentItem.item_name;
            }
            else
            {
                sectionHeadings.Add(currentSection);
                sectionTexts.Add(text);
                currentSection = documentItem.section_desc;
                text = documentItem.item_name;
            }
        }
        if (currentSection.Length > 0)
        {
            sectionHeadings.Add(currentSection);
            sectionTexts.Add(text);
        }
    }
    private void SetAssessor(DocumentType docType)
    {
        DepartmentOrderPersonTableAdapters.DepartmentOrderPeopleTableAdapter ta = new DepartmentOrderPersonTableAdapters.DepartmentOrderPeopleTableAdapter();
        IEnumerator iEnum = ta.GetAllDepartmentPeople(docType.CoId,docType.DeptId,docType.DeptOrderId).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentOrderPerson.DepartmentOrderPeopleEntityRow person = (DepartmentOrderPerson.DepartmentOrderPeopleEntityRow) iEnum.Current;
            PeopleTypeTableAdapters.PeopleTypeTableAdapter ptTA = new PeopleTypeTableAdapters.PeopleTypeTableAdapter();
            IEnumerator iEnumPT = ptTA.GetPeopleTypeByName(docType.CoId, person.people_type, 0).GetEnumerator();
            if (iEnumPT.MoveNext())
            {
                PeopleType.PeopleTypeEntityRow peopleType = (PeopleType.PeopleTypeEntityRow)iEnumPT.Current;
                if(peopleType.flg_multiple == false)
                {
                    if (assessorName.Length > 0)
                    {
                        assessorName += ",";
                    }
                    assessorName += person.people_name;
                }
            }
        }
    }
    private void SetRelatedRiskAssesssments(DocumentType docType)
    {
        foreach (int docId in docType.DocList.Keys)
        {
            DepartmentOrderDoc.DocumentEntityRow document = DatabaseUtility.GetDocument(docId);
            if (document != null)
            {
                if(docId == docType.DocId)
                {
                    docSerial = document.doc_code;
                }
                else
                {
                    relatedRiskAssessments += document.doc_code + ",";
                }
            }
        }
        if (relatedRiskAssessments.Length > 0)
        {
            relatedRiskAssessments = relatedRiskAssessments.Substring(0, relatedRiskAssessments.Length - 1);
        }
    }

	public RiskAssessmentGenerator()
	{
        employer = "";
        siteAddress = "";
        assessorName = "";
        deptSerial = "";
        docSerial = "";
        relatedRiskAssessments = "";
        reviewDate = "";

        sectionHeadings = new List<string>();
        headingCount = 0;
        sectionTexts = new List<string>();
        textCount = 0;
    }

    public string GetNextSectionHeading()
    {
        if (sectionHeadings != null && headingCount < sectionHeadings.Count )
        {
            return sectionHeadings[headingCount++];
        }
        return "";
    }
    public string GetPrevTextHeading()
    {
        if (sectionHeadings != null && textCount< sectionHeadings.Count )
        {
            return sectionHeadings[textCount-1];
        }
        return "";
    }

    public string GetNextSectionText()
    {
        if (sectionTexts != null && textCount < sectionTexts.Count )
        {
            return sectionTexts[textCount++];
        }
        return "";
    }

    protected override void GenerateDocument(Document doc, DocumentType docType, PdfWriter writer)
    {
        Font normalFontSmall = FontFactory.GetFont("Arial", 10);
        Font boldFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD);
        Font boldUnderlineFontSmall = FontFactory.GetFont("Arial", 10, Font.BOLD | Font.UNDERLINE);
        Font smallestFont = FontFactory.GetFont("Arial", 9f, Font.NORMAL);

        // Create a table with 3 columns
        PdfPTable table = new PdfPTable(2);
        table.WidthPercentage = 100;

        table.DefaultCell.Colspan = 2;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.FixedHeight = 40.0f;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.AddCell(new Phrase("General Risk Assessment", FontFactory.GetFont("Times New Roman", 20, Font.BOLD)));

        table.DefaultCell.Colspan = 1;
        table.DefaultCell.FixedHeight = 0.0f;
        table.DefaultCell.Border = Rectangle.BOX;
        table.DefaultCell.FixedHeight = 20f;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;
        table.AddCell(new Phrase("Employer: " + employer, boldUnderlineFontSmall));
        table.AddCell(new Phrase("Site: " + siteAddress, boldUnderlineFontSmall));

        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.DefaultCell.FixedHeight = 60f;
        table.AddCell(new Phrase("Assessor Name: " + assessorName, boldFontSmall));

        table.DefaultCell.VerticalAlignment = Element.ALIGN_TOP;
        table.DefaultCell.Rowspan = 2;
        table.AddCell(new Phrase("Assessment Serial Number: " + docSerial + "/" + deptSerial + "\n\nAssessment Date: ____________\n\nRelated Risk Assessments: " + relatedRiskAssessments, boldFontSmall));

        table.DefaultCell.Rowspan = 1;
        table.DefaultCell.FixedHeight = 40f;
        table.AddCell(new Phrase("Is a More Detailed Assessment Needed:NO, BUT SITE-SPECIFIC INFORMATION REQUIRED ON PAGE 2 OF THIS ASSESSMENT", boldFontSmall));
        table.SpacingAfter = 15f;
        doc.Add(table);

        table = new PdfPTable(2);
        table.WidthPercentage = 100f;
        table.SetWidths(new float[] { 60f, 40f });
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));

        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.DefaultCell.FixedHeight = 60f;
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));
        //AddOverflowText(doc, table, GetNextSectionText(), GetPrevTextHeading());
        //AddOverflowText(doc, table, GetNextSectionText(), GetPrevTextHeading());

        table.DefaultCell.FixedHeight = 0.0f;
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));

        table.DefaultCell.Rowspan = 3;
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));

        table.DefaultCell.Rowspan = 1;
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));

        table.DefaultCell.Colspan = 2;
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionText(),smallestFont));
        //AddOverflowText(doc, table, GetNextSectionText(), GetPrevTextHeading());
        doc.Add(table);

        table = new PdfPTable(2);
        table.SetWidths(new float[] { 55f, 45f });
        table.WidthPercentage = 100;

        table.DefaultCell.FixedHeight = 25f;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_TOP;
        table.AddCell(new Phrase(GetNextSectionHeading() + " " + GetNextSectionText(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionHeading() + " " + GetNextSectionText() + "   " + GetNextSectionHeading() + GetNextSectionText(), boldFontSmall));
        doc.Add(table);


        table = new PdfPTable(2);
        table.SetWidths(new float[] { 70f, 30f });
        table.WidthPercentage = 100;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionHeading(), boldFontSmall));
        table.AddCell(new Phrase(GetNextSectionText(), smallestFont));
        //AddOverflowText(doc, table, GetNextSectionText(), GetPrevTextHeading());
    
        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.AddCell(new Phrase(GetNextSectionText(), boldFontSmall));
        doc.Add(table);

        table = new PdfPTable(2);
        table.WidthPercentage = 100;
        table.DefaultCell.FixedHeight = 15f;
        table.DefaultCell.VerticalAlignment = Element.ALIGN_MIDDLE;
        table.AddCell(new Phrase("10. ASSESSOR’S SIGNATURE:", boldFontSmall));
        table.AddCell(new Phrase("11. NEXT FORMAL REVIEW DATE: " + reviewDate, boldFontSmall));
        table.DefaultCell.Colspan = 2;
        table.DefaultCell.FixedHeight = 0.0f;
        table.AddCell(new Phrase("On completion of reading this document please sign and date below.\nAny questions relating to this document should be raised with a supervisor.", boldFontSmall));
        doc.Add(table);


        table = new PdfPTable(3);
        table.WidthPercentage = 100;
        table.DefaultCell.FixedHeight = 25f;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.AddCell(new Phrase("Name", boldFontSmall));
        table.AddCell(new Phrase("Signed", boldFontSmall));
        table.AddCell(new Phrase("Date", boldFontSmall));

        for (int i = 0; i < 8; i++)
        {
            table.AddCell(""); table.AddCell(""); table.AddCell("");
        }
        doc.Add(table);
        doc.NewPage();
        table = new PdfPTable(1);
        table.WidthPercentage = 100;
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_CENTER;
        table.DefaultCell.FixedHeight = 20f;
        table.AddCell(new Phrase("CONTINUATION / SITE-SPECIFIC INFORMATION (Assessment Serial Number: " + docSerial + " )", boldFontSmall));
        
        table.DefaultCell.HorizontalAlignment = Element.ALIGN_LEFT;
        table.DefaultCell.Border = Rectangle.TOP_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.DefaultCell.FixedHeight = 160f;
        table.AddCell(new Phrase("Continued from Item Number ………overleaf:", boldFontSmall));
        table.DefaultCell.Border = Rectangle.NO_BORDER;
        table.DefaultCell.FixedHeight = 0.0f;
        table.DefaultCell.Border = Rectangle.BOTTOM_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.AddCell(new Phrase("                                           Signed :                                                    Date :", boldFontSmall));

        table.DefaultCell.Border = Rectangle.TOP_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.DefaultCell.FixedHeight = 160f;
        table.AddCell(new Phrase("Continued from Item Number………overleaf:", boldFontSmall));
        table.DefaultCell.Border = Rectangle.TOP_BORDER;
        table.DefaultCell.Border = Rectangle.BOTTOM_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.DefaultCell.FixedHeight = 0.0f;
        table.AddCell(new Phrase("                                           Signed :                                                    Date :", boldFontSmall));

        table.DefaultCell.Border = Rectangle.TOP_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.DefaultCell.FixedHeight = 160f;
        table.AddCell(new Phrase("Supplementary Note No. 1", boldFontSmall));
        table.DefaultCell.Border = Rectangle.BOTTOM_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.DefaultCell.FixedHeight = 0.0f;
        table.AddCell(new Phrase("                                           Signed :                                                    Date :", boldFontSmall));


        table.DefaultCell.Border = Rectangle.TOP_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.DefaultCell.FixedHeight = 160f;
        table.AddCell(new Phrase("Supplementary Note No. 2", boldFontSmall));

        table.DefaultCell.Border = Rectangle.BOTTOM_BORDER | Rectangle.LEFT_BORDER | Rectangle.RIGHT_BORDER;
        table.DefaultCell.FixedHeight = 0.0f;
        table.AddCell(new Phrase("                                           Signed :                                                    Date :", boldFontSmall));

        doc.Add(table);
    }
}
