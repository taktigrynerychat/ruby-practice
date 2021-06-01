# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    include WorkImage

    def next_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i

      new_image_index = next_index(current_index, length)
      next_image_data = show_image(theme_id, new_image_index)

      respond_to do |format|
        if new_image_index.blank?
          format.html do
            render nothing: true, status: :unprocessable_entity
          end
          format.json {}
        else
          format.html do
            render display_theme_path, status: :ok
          end
          format.json do
            render json:
                     { new_image_index: next_image_data[:index],
                       name: next_image_data[:name],
                       file: view_context.asset_url("pictures/#{next_image_data[:file]}"),
                       image_id: next_image_data[:image_id],
                       user_valued: next_image_data[:user_valued],
                       common_avg_value:
                         next_image_data[:common_avg_value],
                       value: next_image_data[:value],
                       status: :ok,
                       notice: 'Successfully listed to next' }
          end
        end
      end
    end

    def prev_image
      current_index = params[:index].to_i
      theme_id = params[:theme_id].to_i
      length = params[:length].to_i

      new_image_index = prev_index(current_index, length)
      prev_image_data = show_image(theme_id, new_image_index)

      respond_to do |format|
        if new_image_index.blank?
          format.html do
            render nothing: true, status: :unprocessable_entity
          end
          format.json {}
        else
          format.html do
            render display_theme_path, status: :ok
          end
          format.json do
            render json:
                     { new_image_index: prev_image_data[:index],
                       name: prev_image_data[:name],
                       file: view_context.asset_url("pictures/#{prev_image_data[:file]}"),
                       image_id: prev_image_data[:image_id],
                       user_valued: prev_image_data[:user_valued],
                       common_avg_value:
                         prev_image_data[:common_avg_value],
                       value: prev_image_data[:value],
                       status: :ok,
                       notice: 'Successfully listed to prev' }
          end
        end
      end
    end

    def next_index(index, length)
      new_index = index
      index < length - 1 ? new_index += 1 : new_index = 0
      new_index
    end

    def prev_index(index, length)
      new_index = index
      index.positive? ? new_index -= 1 : new_index = length - 1
      new_index
    end

    def save_value
      value = params[:value].to_i
      new_value_data = { user_id: current_user.id, image_id: params[:image_id].to_i, value: value }
      valued_image_data = Image.value_and_update(new_value_data)

      respond_to do |format|
        if value.blank?
          format.html { render nothing: true, status: :unprocessable_entity }
        else
          format.json { render json:  {
            user_value:       value,
            values_qty:       valued_image_data[:values_qty],
            image_id:         valued_image_data[:image_id],
            user_valued:      valued_image_data[:user_valued],
            common_ave_value: valued_image_data[:common_ave_value],
            value:            valued_image_data[:value],
            status:           :successfully,
            notice:           'Successfully saved'}
          }
        end
      end

    end
  end
end
