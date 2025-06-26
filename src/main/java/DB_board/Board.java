package DB_board;

public class Board {
	private int number;
	private String writer;
	private String subject;
	private String content;
	private int readCount;
	
	public Board(int number, String writer, String subject, String content, int readCount) {
		super();
		this.number = number;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.readCount = readCount;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	
}
