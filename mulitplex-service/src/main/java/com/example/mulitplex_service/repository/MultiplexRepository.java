package com.example.mulitplex_service.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.mulitplex_service.entity.Multiplexes;
@Repository
public interface MultiplexRepository extends JpaRepository<Multiplexes, Long>{
    @Query(value = "CALL GetMultiplexesByOwnerId(:p_id)", nativeQuery = true)
    List<Multiplexes> findByOwnerId(@Param("p_id") long id);

}
