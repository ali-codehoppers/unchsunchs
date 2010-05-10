using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for WebConstants
/// </summary>
public static class WebConstants
{
    public static class Session
    {
        public static string USER_ID = "USER_ID";
        public static string USER_CO_ID = "USER_CO_ID";
        public static string DEPT_ID = "DEPT_ID";
    }
    public static class Default
    {
        public static string NOT_SET = "[Not Set]";
    }
    public static class Messages
    {
        public static class Information
        {
            public static string RECORD_SAVED = "Record(s) saved successfully.";
            //public static string RECORD_UPDATED = "Record(s) updated successfully.";
            public static string RECORD_DELETED = "Record(s) deleted successfully.";
            public static string ORDER_CANCELLED = "Order cancelled successfully.";
            public static string ORDER_UNCANCELLED = "Order Uncancelled successfully.";
        }
        public static class Error
        {
            public static string SESSION_EXPIRED = "Session Expired. Please login again.";
            public static string INVALID_ID = "Select record is not present.";
            public static string ALREAD_EXISTS = "Record with this name already exists.";
            public static string CONNECTION_ERROR = "Connection error try again.";
            public static string NEXT_WARNING_ENTERRECORD = "Please enter a record to continue.";
            public static string NEXT_WARNING_COMPANYAUTOSAVE = "Autosave is not enabled for the company you belong to.";
            public static string SUPERVISOR_SELECTION_ERROR = "Only one supervisor is allowed for an order.";
            public static string SELECT_ATLEAST_ONE_DOCTYPE = "Atleast one Document Type must be selected.";
            public static string PERSON_NOT_ADDED = "Person could not be added against one or more person type.";
            public static string DOC_NOT_GENERATED = "Document could not be generated.";
            public static string NO_DEPT_DEFINED = "No department defined in the system. Atleast one department must be defined.";
            public static string SELECT_ATLEAST_ONE_PERSON_TYPE = "Atleast one Person Type must be selected.";
        }
    }
    public static class Request
    {
        public static string SESSION_EXPIRED = "sessionExpired";
        public static string DEPT_PERSON_ID = "deptPersonId";
        public static string ACTION = "action";
        public static string DEPT_ID = "depId";
        public static string ERROR_MSG = "errorMsg";
        public static string INFO_MSG = "infoMsg";
        public static string DEPT_ORDER_ID = "deptOrderId";
        public static string NO_DEPT = "noDept";
        public static string PERSON_NAME = "personName";
        public static string DOC_TYPE_ID = "docTypeId";
        public static string DOC_TYPE_NAME = "docTypeName";
        public static string DOC_ID = "docId";
        public static string DOC_NAME = "docId";
    }
    public static class RequestValues
    {
        public static string ACTION_EDIT = "edit";
        public static string ACTION_DELETE = "delete";
    }
    public static class Configuration
    {
        public static string PHYSICAL_PATH = "PhysicalPath";
    }
}
