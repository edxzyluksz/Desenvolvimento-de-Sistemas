package com.edxzyluksz.gamestore.Repository;
import org.springframework.data.repository.CrudRepository;
import com.edxzyluksz.gamestore.Model.Game;

public interface GameRepository extends CrudRepository <Game, Integer> {

}
