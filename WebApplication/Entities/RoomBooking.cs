namespace WebApplication.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RoomBooking")]
    public partial class RoomBooking
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RoomBooking()
        {
            RoomBookingServices = new HashSet<RoomBookingService>();
        }

        public int RoomBookingID { get; set; }

        public int? CustomerID { get; set; }

        public int Person { get; set; }

        [Required]
        [StringLength(20)]
        public string RoomID { get; set; }

        [Required]
        [StringLength(250)]
        public string Name { get; set; }

        [Required]
        [StringLength(15)]
        public string Phone { get; set; }

        [Required]
        [StringLength(100)]
        public string Email { get; set; }

        [Column(TypeName = "date")]
        public DateTime CheckinDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime CheckoutDate { get; set; }

        [Required]
        [StringLength(10)]
        public string EmployeeID { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public virtual CustomerTV CustomerTV { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Employee Employee1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RoomBookingService> RoomBookingServices { get; set; }
    }
}
