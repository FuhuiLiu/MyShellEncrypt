package aq;

import org.jdom2.*;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.XMLOutputter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


/**
 * Created by F8LEFT on 2015/12/31.
 */
public class ManifestXml {
    private static String appKey = "APPLICATION_CLASS_NAME";
    private static String proxyApp = "aqcxbom.myshell2.ProxyApplication";

    private static final String NAME_SPACE = "http://schemas.android.com/apk/res/android";
    private static final String NAME_PREFIX = "android";
    private static final String META_DATA = "meta-data";
    private static final String NAME = "name";
    private static final String VALUE = "value";

    //处理AndroidMainfest.xml文件
    public static void modify(File xmlFile) {
        SAXBuilder builder = new SAXBuilder();
        String oldApplication = null;

        try {
            Document doc = builder.build(xmlFile);
            Element root = doc.getRootElement();    //mainfest
            Element application = root.getChild("application");

            //                                    android        http://schemas.android.com/apk/res/android
            Namespace ns = Namespace.getNamespace(NAME_PREFIX, NAME_SPACE);
            //                                             name
            Attribute attribute = application.getAttribute(NAME, ns);
            if (attribute != null) {
                oldApplication = attribute.getValue();
                attribute.setValue(proxyApp);
            } else {
                application.setAttribute(NAME, proxyApp, ns);
            }

            if (oldApplication != null) {           //Add meta-data
                application.addContent(new Element(META_DATA).setAttribute(NAME, appKey, ns).setAttribute(VALUE, oldApplication, ns));
            }

            XMLOutputter XMLOutput = new XMLOutputter();
            XMLOutput.output(doc, new FileOutputStream(xmlFile));
        } catch (JDOMException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
