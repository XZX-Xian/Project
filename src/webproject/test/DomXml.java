package webproject.test;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

/**
 * 使用DOM的方式解析XML
 */
public class DomXml {
    public static void main(String[] args) {
        //1 拿到要解析的XML
        File file=new File("src/webproject/test/stude.xml");
        try {
            //2 创建一个DocumentBuilderFactory
            DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
            //3 创建一个DocumentBuilder对象
            DocumentBuilder builder=factory.newDocumentBuilder();
            //4 创建一个 Document对象 并且把读到的 XML加载进去
            Document doc=builder.parse(file);
            //5 根据节点名称拿到Student 节点
            NodeList node=doc.getElementsByTagName("Student");
//            System.out.println(node.item(0).getFirstChild().getNextSibling().getFirstChild().getNodeValue());
            //6 循环遍历 NodeList 去拿 Student 节点中的 ID Name 节点的值
            for (int i=0;i<node.getLength();i++){
//                System.out.println(node.item(i).getFirstChild().getNextSibling().getFirstChild().getNodeValue());
                System.out.println(doc.getElementsByTagName("Id").item(i).getFirstChild().getNodeValue());
            }

//            System.out.println(doc);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
