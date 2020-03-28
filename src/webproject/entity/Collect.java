package webproject.entity;

/**
 * 商品收藏的实体类
 */
public class Collect {
        private int shopid;
        private String name;
        private String money;
        private int size;
        private String oce;
        private String account;

    public int getShopid() {
        return shopid;
    }

    public void setShopid(int shopid) {
        this.shopid = shopid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getOce() {
        return oce;
    }

    public void setOce(String oce) {
        this.oce = oce;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }
}
