package Entity;

public class Book {
	
	int id;
	String Book_Name;
	String Book_Type;
	String Book_Year;
	int Book_Price;
	String Book_Author;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBook_Name() {
		return Book_Name;
	}
	public void setBook_Name(String book_Name) {
		Book_Name = book_Name;
	}
	public String getBook_Type() {
		return Book_Type;
	}
	public void setBook_Type(String book_Type) {
		Book_Type = book_Type;
	}
	public String getBook_Year() {
		return Book_Year;
	}
	public void setBook_Year(String book_Year) {
		Book_Year = book_Year;
	}
	public int getBook_Price() {
		return Book_Price;
	}
	public void setBook_Price(int book_Price) {
		Book_Price = book_Price;
	}
	public String getBook_Author() {
		return Book_Author;
	}
	public void setBook_Author(String book_Author) {
		Book_Author = book_Author;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", Book_Name=" + Book_Name + ", Book_Type=" + Book_Type + ", Book_Year=" + Book_Year
				+ ", Book_Price=" + Book_Price + ", Book_Author=" + Book_Author + "]";
	}
	public Book(int id, String book_Name, String book_Type, String book_Year, int book_Price, String book_Author) {
		super();
		this.id = id;
		Book_Name = book_Name;
		Book_Type = book_Type;
		Book_Year = book_Year;
		Book_Price = book_Price;
		Book_Author = book_Author;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
