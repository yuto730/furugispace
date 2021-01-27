import React from 'react';
import Modal from 'react-modal';

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)'
  }
};

class Session extends React.Component {
  constructor() {
    super();
    this.state = {
      modalIsOpen: false
    };

    this.openModal = this.openModal.bind(this);
    this.afterOpenModal = this.afterOpenModal.bind(this);
    this.closeModal = this.closeModal.bind(this);
  }

  openModal() {
    this.setState({modalIsOpen: true});
  }

  afterOpenModal() {
    // references are now sync'd and can be accessed.
    this.subtitle.style.color = '#333';
  }

  closeModal() {
    this.setState({modalIsOpen: false});
  }

  render() {
    return (
      <div>
        <div class="login">
          <div class="login_box">
            <button onClick={this.openModal}>ログイン</button>
          </div>
        </div>
        <Modal
          isOpen={this.state.modalIsOpen}
          onAfterOpen={this.afterOpenModal}
          onRequestClose={this.closeModal}
          style={customStyles}
          contentLabel="Example Modal"
        >

          <div style={
            {width: "480px",
            margin: "20px auto"}
          }>
            <h2 ref={subtitle => this.subtitle = subtitle} style={
              {textAlign: "center",
              fontSize: "20px",
              fontWeight: "bold"}
            }>ログイン</h2>
            <form style={
              {display: "flex",
              justifyContent: "space-around",
              marginTop: "30px"}
            }>
              <a href="/users/sign_in" style={
                {textAlign: "center",
                fontSize: "16px",
                backgroundColor: "#FF9D30",
                width: "200px",
                padding: "14px 0",
                borderRadius: "30px",
                color: "#fff"}
              }>ユーザーログイン</a>
              <a href="/stores/sign_in" style={
                {textAlign: "center",
                fontSize: "16px",
                backgroundColor: "#FF9D30",
                width: "200px",
                padding: "14px 0",
                borderRadius: "30px",
                color: "#fff"}
              }>店舗ログイン</a>
            </form>
          </div>
        </Modal>
      </div>
    );
  }
}

export default Session;