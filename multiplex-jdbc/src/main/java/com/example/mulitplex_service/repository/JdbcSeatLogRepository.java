package com.example.mulitplex_service.repository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Optional;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.SeatLog;

@Repository
public class JdbcSeatLogRepository {

    @Autowired
    private DataSource dataSource;

    private SeatLog mapRow(ResultSet rs) throws SQLException {
        SeatLog seatLog = new SeatLog();
        seatLog.setSeatId(rs.getLong("seat_id"));
        seatLog.setShowDate(rs.getDate("show_date").toLocalDate());
        seatLog.setShowTime(rs.getTime("show_time").toLocalTime());
        seatLog.setMovieId(rs.getLong("movie_id"));
        seatLog.setScreenId(rs.getLong("screen_id"));
        seatLog.setUserId(rs.getLong("user_id"));
        seatLog.setLockedAt(rs.getTimestamp("locked_at").toLocalDateTime());
        seatLog.setExpiresAt(rs.getTimestamp("expires_at").toLocalDateTime());
        return seatLog;
    }

    public Optional<SeatLog> findBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId(Long seatId, LocalDate showDate, LocalTime showTime, Long screenId, Long movieId) {
        String sql = "CALL findBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId(?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, seatId);
            ps.setDate(2, java.sql.Date.valueOf(showDate));
            ps.setTime(3, java.sql.Time.valueOf(showTime));
            ps.setLong(4, screenId);
            ps.setLong(5, movieId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapRow(rs));
                } else {
                    return Optional.empty();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

    public void deleteBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId(Long seatId, LocalDate showDate, LocalTime showTime, Long screenId, Long movieId) {
        String sql = "CALL deleteBySeatIdAndShowDate(?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, seatId);
            ps.setDate(2, java.sql.Date.valueOf(showDate));
            ps.setTime(3, java.sql.Time.valueOf(showTime));
            ps.setLong(4, screenId);
            ps.setLong(5, movieId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteByExpiresAtBefore() {
        String sql = "CALL deleteexpiredseatlogs()";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void save(SeatLog seatLog) {
        String sql = "INSERT INTO seat_log (seat_id, show_date, show_time, movie_id, screen_id, user_id, locked_at, expires_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setLong(1, seatLog.getSeatId());
            ps.setDate(2, java.sql.Date.valueOf(seatLog.getShowDate()));
            ps.setTime(3, java.sql.Time.valueOf(seatLog.getShowTime()));
            ps.setLong(4, seatLog.getMovieId());
            ps.setLong(5, seatLog.getScreenId());
            ps.setLong(6, seatLog.getUserId());
            ps.setTimestamp(7, java.sql.Timestamp.valueOf(seatLog.getLockedAt()));
            ps.setTimestamp(8, java.sql.Timestamp.valueOf(seatLog.getExpiresAt()));
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
