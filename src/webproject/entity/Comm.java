package webproject.entity;

/**
 * 商品信息
 */
public class Comm {
    private String account;
    private int comID;          //商品编号
    private String comMoney;    //商品价格
    private String comColor;    //商品颜色
    private int comSize;        //商品尺码
    private int comQuantity;    //商品数量
    private String comName;     //商品名称
    private int comCount;       //商品销量数
    private int comAppCount;    //商品评价数
    private String comOve;      //商品展示图(悬浮前)
    private String comOut;      //商品展示图(悬浮后)
    private String comCCTV;     //商品详情展示图
    private int comtype;        //商品类型
    private String brand;       //商品品牌
    private String modell;      //商品型号
    private String state;       //出售状态
    private String Product;     //商品参数
    private String userid;      //用户商品添加id
    private int size;           //用户添加商品数量
    private int id;             //商品详情ID
    private int limit;          //商品状态

    //封装
    public int getComID() {
        return comID;
    }

    public void setComID(int comID) {
        this.comID = comID;
    }

    public String getComMoney() {
        return comMoney;
    }

    public void setComMoney(String comMoney) {
        this.comMoney = comMoney;
    }

    public String getComColor() {
        return comColor;
    }

    public void setComColor(String comColor) {
        this.comColor = comColor;
    }

    public int getComSize() {
        return comSize;
    }

    public void setComSize(int comSize) {
        this.comSize = comSize;
    }

    public int getComQuantity() {
        return comQuantity;
    }

    public void setComQuantity(int comQuantity) {
        this.comQuantity = comQuantity;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public int getComCount() {
        return comCount;
    }

    public void setComCount(int comCount) {
        this.comCount = comCount;
    }

    public int getComAppCount() {
        return comAppCount;
    }

    public void setComAppCount(int comAppCount) {
        this.comAppCount = comAppCount;
    }

    public String getComOve() {
        return comOve;
    }

    public void setComOve(String comOve) {
        this.comOve = comOve;
    }

    public String getComOut() {
        return comOut;
    }

    public void setComOut(String comOut) {
        this.comOut = comOut;
    }

    public String getComCCTV() {
        return comCCTV;
    }

    public void setComCCTV(String comCCTV) {
        this.comCCTV = comCCTV;
    }

    public int getComtype() {
        return comtype;
    }

    public void setComtype(int comtype) {
        this.comtype = comtype;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModell() {
        return modell;
    }

    public void setModell(String modell) {
        this.modell = modell;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getProduct() {
        return Product;
    }

    public void setProduct(String product) {
        Product = product;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
}
