import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ""
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {
    e.preventDefault();
    this.setState({
      searchTerm: e.target.value
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  render() {
    const { searchTerm } = this.state;
    const { giphys } = this.props;
    return (
      <div>
        <form>
          <h1>Search Giphys</h1>
          <input
            type='text'
            onChange={this.handleChange}
            value={searchTerm}
            />
          <button
            onClick={this.handleSubmit} type='submit'
            >
            Submit
          </button>
        </form>
        <GiphysIndex giphys={ giphys } />
      </div>
    );
  }
}

export default GiphysSearch;
