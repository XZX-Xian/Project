package webproject.entity;

public class Order {
    private int ordernumber;
    private int  shopID;
    private String Name;
    private String Money;
    private int Size;
    private String Ove;
    private String Userid;
    private  String State;

    public String getState() {
        return State;
    }

    public void setState(String state) {
        State = state;
    }

    public int getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(int ordernumber) {
        this.ordernumber = ordernumber;
    }

    public int getShopID() {
        return shopID;
    }

    public void setShopID(int shopID) {
        this.shopID = shopID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getMoney() {
        return Money;
    }

    public void setMoney(String money) {
        Money = money;
    }

    public int getSize() {
        return Size;
    }

    public void setSize(int size) {
        Size = size;
    }

    public String getOve() {
        return Ove;
    }

    public void setOve(String ove) {
        Ove = ove;
    }

    public String getUserid() {
        return Userid;
    }

    public void setUserid(String userid) {
        Userid = userid;
    }
}
