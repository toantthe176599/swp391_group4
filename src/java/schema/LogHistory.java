/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schema;

import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class LogHistory {

    private String logId, eventId, account_id, typeAction;
    private Date date;

    public LogHistory() {
    }

    public LogHistory(String logId, String eventId, String account_id, String typeAction, Date date) {
        this.logId = logId;
        this.eventId = eventId;
        this.account_id = account_id;
        this.typeAction = typeAction;
        this.date = date;
    }

    public LogHistory(String eventId, String account_id, String typeAction) {
        this.eventId = eventId;
        this.account_id = account_id;
        this.typeAction = typeAction;
    }

    public String getEventId() {
        return eventId;
    }

    public String getAccount_id() {
        return account_id;
    }

    public String getTypeAction() {
        return typeAction;
    }

    public Date getDate() {
        return date;
    }

    public String getLogId() {
        return logId;
    }

}
