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
public class RiskAssessmentGenerator : DetailDocumentTypeGenerator
{
    string employer;
    string siteAddress;
    string assessorName;
    string deptSerial;
    string docSerial;
    string relatedRiskAssessments;
    
    string reviewDate;
    
    protected override void  SetRemainingData(DocumentType docType)
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
    }
    private void SetAssessor(DocumentType docType)
    {
        
        DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter ta = new DepartmentOrderPersonTableAdapters.DepartmentOrderPersonEntityTableAdapter();
        IEnumerator iEnum = ta.GetAllOrderPersonsByOrderId(docType.DeptId, docType.CoId, docType.DeptOrderId).GetEnumerator();
        while (iEnum.MoveNext())
        {
            DepartmentOrderPerson.DepartmentOrderPersonEntityRow person = (DepartmentOrderPerson.DepartmentOrderPersonEntityRow) iEnum.Current;
            if (person.Issuperrvisor_checkNull() == false && person.superrvisor_check == 1)
            {
                assessorName = person.name_desc;
                break;
            }
        }        
    }
    private void SetRelatedRiskAssesssments(DocumentType docType)
    {
        DepartmentOrderDoc.DocumentEntityRow document = DatabaseUtility.GetDocument(docType.DocId);
        if (document != null && document.Isrelated_doc_codesNull() == false)
        {
            relatedRiskAssessments = document.related_doc_codes;
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

    }

    protected override void GenerateDocument(Document doc, DocumentType docType, string addSheet, PdfWriter writer)
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

        for (int i = 0; i < 7; i++)
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
