/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import config.GoogleInfomation;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import schema.GoogleUser;

/**
 *
 * @author LENOVO
 */
public class GoogleAuthentication {
    // get token

    public static String getToken(final String code, String redirectURL) throws ClientProtocolException, IOException {
        String response = Request.Post(GoogleInfomation.GOOGLE_LINK_GET_TOKEN).
                bodyForm(Form.form().add("client_id", GoogleInfomation.GOOGLE_CLIENT_ID).
                        add("client_secret", GoogleInfomation.GOOGLE_CLIENT_SECRET).
                        add("redirect_uri", redirectURL).
                        add("code", code).
                        add("grant_type", GoogleInfomation.GOOLE_GRANT_TYPE).
                        build()).
                execute().
                returnContent().
                asString();

        JsonObject jsonobj = new Gson().fromJson(response, JsonObject.class);

        String accessToken = jsonobj.get("access_token").toString().replaceAll("\"", "");

        return accessToken;
    }

    //get User informaiton
    public static GoogleUser getUserInfo(final String accesToken) throws ClientProtocolException, IOException {
        String link = GoogleInfomation.GOOGLE_LINK_GET_USER_INFOR + accesToken;
        String response = Request.Get(link).execute().returnContent().asString();
        System.out.println("999999999999999999999999999999999");

        System.out.println(response);
        System.out.println("999999999999999999999999999999999");
        GoogleUser googlePjo = new Gson().fromJson(response, GoogleUser.class);
        return googlePjo;
    }
}
