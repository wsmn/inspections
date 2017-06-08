import React from 'react'
import ReactDOM from 'react-dom'

function Square(props) {
  return (
    <button className="square" onClick={props.onClick}>
      {props.value}
    </button>
  );
}

class Board extends React.Component {
  renderSquare(i, j) {
    return (
      <Square
        value={this.props.squares[i][j]}
        onClick={() => this.props.onClick(i, j)}
      />
    );
  }

  render() {
    const rows = [];
    for (var i = 0; i < 3; i++) {
      rows.push(
        <div key={i} className="board-row">
          {this.renderSquare(i, 0)}
          {this.renderSquare(i, 1)}
          {this.renderSquare(i, 2)}
        </div>
      );
    }
    return (
      <div> {rows} </div>
    );
  }
}

class Game extends React.Component {
  constructor () {
    super();
    this.state = {
      history: [{
        squares: [[null, null, null], [null, null, null], [null, null, null]],
      }],
      stepNumber: 0,
      xIsNext: true,
    };
  }

  handleClick(i, j) {
    const history = this.state.history.slice(0, this.state.stepNumber + 1);
    const current = history[history.length - 1];
    const squares = current.squares.slice();
    if (calculateWinner(squares) || squares[i][j]) {
      return;
    }
    squares[i][j] = this.state.xIsNext ? 'X' : 'O';
    this.setState({
      history: history.concat([{
        squares: squares
      }]),
      stepNumber: history.length,
      xIsNext: !this.state.xIsNext,
    });
  }

  jumpTo(step) {
    this.setState({
      stepNumber: step,
      xIsNext: (step % 2) ? false : true,
    });
  }

  render() {
    const history = this.state.history;
    const current = history[this.state.stepNumber];
    const winner = calculateWinner(current.squares);

    const moves = history.map((step, move) => {
      console.log(step);
      console.log(move);
      const desc = move ? 'Move #' + move : 'Game start';
      let description;
      if (move == this.state.stepNumber) {
        description = <strong>{desc}</strong>;
      } else {
        description = (
          <a href="#" onClick={() => this.jumpTo(move)}>
            {desc}
          </a>
        );
      }

      return (
        <li key={move}>
          {description}
        </li>
      );
    });

    let status;
    if (winner) {
      status = 'Winner: ' + winner;
    } else {
      status = 'Next player: ' + (this.state.xIsNext ? 'X' : 'O');
    }

    return (
      <div className="game">
        <div className="game-board">
          <Board
            squares={current.squares}
            onClick={(i, j) => this.handleClick(i,j)}
          />
        </div>
        <div className="game-info">
          <div>{status}</div>
          <ol>{moves}</ol>
        </div>
      </div>
    );
  }
}

function calculateWinner(squares) {
  const lines = [
    [[0,0], [0,1], [0,2]],
    [[1,0], [1,1], [1,2]],
    [[2,0], [2,1], [2,2]],
    [[0,0], [1,0], [2,0]],
    [[0,1], [1,1], [2,1]],
    [[0,2], [1,2], [2,2]],
    [[0,0], [1,1], [2,2]],
    [[2,0], [1,1], [0,2]],
  ];
  for (let i = 0; i < lines.length; i++) {
    const [[ai, aj], [bi, bj], [ci, cj]] = lines[i];
    if (squares[ai][aj] && squares[ai][aj] === squares[bi][bj] && squares[ai][aj] === squares[ci][cj]) {
      return squares[ai][aj];
    }
  }
  return null;
}

// ========================================

ReactDOM.render(
  <Game />,
  document.getElementById('root')
);
