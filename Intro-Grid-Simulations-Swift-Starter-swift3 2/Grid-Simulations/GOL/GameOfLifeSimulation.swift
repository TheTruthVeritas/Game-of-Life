//
//  GameOfLifeSimulation.swift
//  Grid-Simulations
//
//  Created by Yujin Ariza on 3/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class GameOfLifeSimulation: Simulation {

    public var liveChar: Character = "👾"
    
    public override func update() {
        var newGrid = grid
        for x in 0..<grid.count {
            for y in 0..<grid[0].count {
                countNeighbors(grid: grid, column: x, row: y)
                let liveNeighbors = countNeighbors(grid: grid, column: x, row: y)
                if grid[x][y] == liveChar {
                    if liveNeighbors < 2 {
                        newGrid[x][y] = nil
                    } else if liveNeighbors == 2 || liveNeighbors == 3 {
                        newGrid[x][y] = liveChar
                    } else {
                        newGrid[x][y] = nil
                    }
                    
                }
                if grid[x][y] == nil && liveNeighbors == 3{
                    newGrid[x][y] = liveChar
                }
            }
        }
        
        // Student code here!
        //grid // this contains your 2D grid! Update this value.
        grid = newGrid
    }

    func getAlive(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        if x >= grid.count || y >= grid[0].count || x < 0 || y < 0 {
            return 0
        } else if grid[x][y]  == nil {
            return 0
        } else {
            return 1
        }
    }

    
     func countNeighbors(grid: [[Character?]], column x: Int, row y: Int) -> Int {
        let aliveLeft = getAlive(grid: grid, column: x - 1, row: y)
        let aliveRight = getAlive(grid: grid, column: x + 1, row: y)
        let aliveDown = getAlive(grid: grid, column: x, row: y - 1)
        let aliveTop = getAlive(grid: grid, column: x, row: y + 1)
        let aliveTopLeft = getAlive(grid: grid, column: x - 1, row: y + 1)
        let aliveTopRight = getAlive(grid: grid, column: x + 1, row: y + 1)
        let aliveBottomLeft = getAlive(grid: grid, column: x - 1, row: y - 1)
        let aliveBottomRight = getAlive(grid: grid, column: x + 1, row: y - 1)
        
        let total: Int = aliveLeft + aliveRight + aliveDown + aliveTop + aliveTopLeft + aliveTopRight + aliveBottomLeft + aliveBottomRight
        
        return total
    }
}
