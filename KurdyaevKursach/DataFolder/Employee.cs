//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KurdyaevKursach.DataFolder
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            this.Excursion = new HashSet<Excursion>();
        }
    
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public string EmployeeSecondName { get; set; }
        public string EmployeeLastName { get; set; }
        public string EmployeeLanguage { get; set; }
        public string EmployeeCountry { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Excursion> Excursion { get; set; }
    }
}