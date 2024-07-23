/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author HP
 */
public class TicketUltils {

    public static boolean isExpired(String startTime, String startDate) {
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss[.SSSSSSS]");
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        LocalTime time = LocalTime.parse(startTime, timeFormatter);
        LocalDate date = LocalDate.parse(startDate, dateFormatter);

        LocalDateTime ticketDateTime = LocalDateTime.of(date, time);
        LocalDateTime currentDateTime = LocalDateTime.now();

        return ticketDateTime.isBefore(currentDateTime);
    }
}
