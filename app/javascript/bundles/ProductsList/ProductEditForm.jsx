import React from 'react'
import map from 'lodash/map'
import { Button, Item, Input, TextArea, Form, Label } from 'semantic-ui-react'

class ProductEditForm extends React.Component {

  handleChange = (e, { name, value }) => this.props.change(name, value)
  handleChangeMainOption = (e, { index, name, value }) => {
    const { productForm, change } = this.props
    const mainOptions = productForm.mainOptions.slice()
    mainOptions[index] = { ...mainOptions[index], [name]: value }
    change('mainOptions', mainOptions)
  }
  handleSubmit = () => {
    const { productForm, update } = this.props
    update(productForm)
  }
  handleCancelButton = () => this.props.cancel()

  render() {
    const { product } = this.props
    return (
      <Item.Content>
          <Item.Description>
            <Form>
              <Form.Input size='large' name='title' defaultValue={product.title} onChange={this.handleChange}/>
              <Form.TextArea name='brief'
                autoHeight
                defaultValue={product.brief}
                onChange={this.handleChange}/>
              <Form.TextArea name='description'
                autoHeight
                defaultValue={product.description}
                onChange={this.handleChange}/>

              {map(product.mainOptions, (mo, index) =>
                <Form.Group widths='equal' key={index}>
                  <Form.Input index={index}
                    name='name'
                    defaultValue={mo.name}
                    onChange={this.handleChangeMainOption}/>
                  <Form.Input index={index}
                    name='cost'
                    type='number'
                    step='0.01'
                    labelPosition='left'
                    defaultValue={mo.cost}
                    onChange={this.handleChangeMainOption}>
                    <input/>
                    <Label basic>₽</Label>
                  </Form.Input>
                </Form.Group>)}
            </Form>
          </Item.Description>
          <Item.Extra>
            <Button floated='right' color='green' onClick={this.handleSubmit}>
              Сохранить
            </Button>
            <Button floated='right' color='red' onClick={this.handleCancelButton}>
              Отменить
            </Button>
          </Item.Extra>
      </Item.Content>
    )
  }
}

import { connect } from 'react-redux'
import { getProduct } from 'selectors/products'
import { bindActionCreators } from 'redux'
import { update, change, cancel } from 'store/ui/products/row/actions'
import PropTypes from 'prop-types'

ProductEditForm.propTypes = {
  product: PropTypes.object.isRequired,
  productForm: PropTypes.object.isRequired,
  update: PropTypes.func.isRequired,
  change: PropTypes.func.isRequired,
  cancel: PropTypes.func.isRequired,
}

const mapStateToProps = (state, ownProps) => (
  {
    product: getProduct(state, ownProps),
    productForm: state.ui.products.row,
  }
)

const mapDispatchToProps = (dispatch) => bindActionCreators({ update, change, cancel }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(ProductEditForm)
