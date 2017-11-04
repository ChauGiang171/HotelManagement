namespace WebApplication.Entities
{
	using System;
	using System.Data.Entity;
	using System.ComponentModel.DataAnnotations.Schema;
	using System.Linq;

	public partial class HotelManagementDAO : DbContext
	{
		public HotelManagementDAO()
			: base("name=HotelManagementDAO")
		{
		}

		public virtual DbSet<Account> Accounts { get; set; }
		public virtual DbSet<CustomerTV> CustomerTVs { get; set; }
		public virtual DbSet<Employee> Employees { get; set; }
		public virtual DbSet<Room> Rooms { get; set; }
		public virtual DbSet<RoomBooking> RoomBookings { get; set; }
		public virtual DbSet<RoomBookingService> RoomBookingServices { get; set; }
		public virtual DbSet<RoomService> RoomServices { get; set; }
		public virtual DbSet<RoomStatu> RoomStatus { get; set; }
		public virtual DbSet<RoomType> RoomTypes { get; set; }
		public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Account>()
				.Property(e => e.Username)
				.IsUnicode(false);

			modelBuilder.Entity<Account>()
				.Property(e => e.EmployeeID)
				.IsUnicode(false);

			modelBuilder.Entity<Account>()
				.Property(e => e.Password)
				.IsUnicode(false);

			modelBuilder.Entity<CustomerTV>()
				.Property(e => e.Phone)
				.IsUnicode(false);

			modelBuilder.Entity<CustomerTV>()
				.Property(e => e.Email)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.EmployeeID)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.Phone)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.Property(e => e.Email)
				.IsUnicode(false);

			modelBuilder.Entity<Employee>()
				.HasOptional(e => e.Account)
				.WithRequired(e => e.Employee);

			modelBuilder.Entity<Employee>()
				.HasMany(e => e.RoomBookings)
				.WithRequired(e => e.Employee)
				.HasForeignKey(e => e.EmployeeID)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Employee>()
				.HasMany(e => e.RoomBookings1)
				.WithRequired(e => e.Employee1)
				.HasForeignKey(e => e.EmployeeID)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Room>()
				.Property(e => e.RoomID)
				.IsUnicode(false);

			modelBuilder.Entity<Room>()
				.Property(e => e.RentalPrice)
				.HasPrecision(19, 4);

			modelBuilder.Entity<Room>()
				.Property(e => e.Image)
				.IsUnicode(false);

			modelBuilder.Entity<RoomBooking>()
				.Property(e => e.RoomID)
				.IsUnicode(false);

			modelBuilder.Entity<RoomBooking>()
				.Property(e => e.Phone)
				.IsUnicode(false);

			modelBuilder.Entity<RoomBooking>()
				.Property(e => e.Email)
				.IsUnicode(false);

			modelBuilder.Entity<RoomBooking>()
				.Property(e => e.EmployeeID)
				.IsUnicode(false);

			modelBuilder.Entity<RoomBooking>()
				.Property(e => e.Status)
				.IsUnicode(false);

			modelBuilder.Entity<RoomBooking>()
				.HasMany(e => e.RoomBookingServices)
				.WithRequired(e => e.RoomBooking)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<RoomService>()
				.Property(e => e.Price)
				.HasPrecision(19, 4);

			modelBuilder.Entity<RoomService>()
				.HasMany(e => e.RoomBookingServices)
				.WithRequired(e => e.RoomService)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<RoomStatu>()
				.Property(e => e.Name)
				.IsUnicode(false);

			modelBuilder.Entity<RoomStatu>()
				.HasMany(e => e.Rooms)
				.WithRequired(e => e.RoomStatu)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<RoomType>()
				.Property(e => e.Name)
				.IsUnicode(false);

			modelBuilder.Entity<RoomType>()
				.HasMany(e => e.Rooms)
				.WithRequired(e => e.RoomType)
				.WillCascadeOnDelete(false);
		}
	}
}
