//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class APMT_Company
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public APMT_Company()
        {
            this.APMT_Company_User = new HashSet<APMT_Company_User>();
            this.APMT_Project = new HashSet<APMT_Project>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public Nullable<int> Admin_id { get; set; }
        public Nullable<bool> Allowed { get; set; }
        public Nullable<System.DateTime> Register_at { get; set; }
        public Nullable<System.DateTime> Update_at { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<APMT_Company_User> APMT_Company_User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<APMT_Project> APMT_Project { get; set; }
    }
}
